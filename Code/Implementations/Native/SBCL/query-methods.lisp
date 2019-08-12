(cl:in-package #:trucler-native-sbcl)

;;; Return the value of KEY in ALIST, or NIL.
(defun alist-value (key alist &key (default nil) (test #'eql))
  (let ((cons-or-nil (assoc key alist :test test)))
    (if (null cons-or-nil)
        default
        (cdr cons-or-nil))))

(defun leaf-type (leaf env default)
  (sb-kernel:type-specifier
   (sb-kernel:type-intersection
    (sb-c::leaf-type leaf)
    (or (alist-value leaf (sb-c::lexenv-type-restrictions env))
        default
        sb-kernel:*universal-type*))))

(defun var-type (var env)
  (leaf-type var env sb-kernel:*universal-type*))

(defun fun-type (var env)
  (leaf-type var env sb-kernel:*universal-fun-type*))

(defun leaf-dynamic-extent (leaf env)
  (declare (ignore env))
  (and (sb-c::leaf-dynamic-extent leaf) t))

(defmethod trucler:describe-variable ((client native-client) (env null) name)
  (trucler:describe-variable client (sb-kernel:make-null-lexenv) name))

(defmethod trucler:describe-variable ((client native-client) (env sb-kernel:lexenv) name)
  (let ((var (alist-value name (sb-c::lexenv-vars env))))
    (etypecase var
      (sb-c::lambda-var
       (make-instance 'lexical-variable-description
         :name name
         :identity var
         :dynamic-extent (leaf-dynamic-extent var env)
         :ignore (cond ((sb-c::lambda-var-ignorep var)
                        'cl:ignore)
                       ((sb-c::leaf-ever-used var)
                        'cl:ignorable)
                       (t nil))
         :type (var-type var env)))
      (sb-c::global-var
       (ecase (sb-c::global-var-kind var)
         (:special
          (make-instance 'local-special-variable-description
            :name name
            :type (var-type var env)))
         (:global
          (make-instance 'global-variable-description
            :name name
            :type (var-type var env)))
         (:unknown nil)))
      (sb-c::constant
       (make-instance 'constant-variable-description
         :name name
         :value (sb-c::constant-value var)))
      (cons
       (make-instance 'local-symbol-macro-description
         :name name
         :expansion (cdr var)))
      (null
       (ecase (sb-int:info :variable :kind name)
         (:special
          (make-instance 'global-special-variable-description
            :name name))
         (:macro
          (make-instance 'global-symbol-macro-description
            :name name
            :expansion (sb-int:info :variable :macro-expansion name)))
         (:constant
          (make-instance 'constant-variable-description
            :name name
            :value (symbol-value name)))
         (:unknown nil))))))

(defmethod trucler:describe-function ((client native-client) (env null) name)
  (trucler:describe-function client (sb-kernel:make-null-lexenv) name))

(defmethod trucler:describe-function ((client native-client) (env sb-kernel:lexenv) name)
  (let ((fun (alist-value name (sb-c::lexenv-funs env) :test #'equal)))
    (etypecase fun
      (sb-c::functional
       (make-instance 'local-function-description
         :name name
         :type (fun-type fun env)
         :identity fun
         :inline (sb-c::functional-inlinep fun)
         :dynamic-extent (leaf-dynamic-extent fun env)))
      (sb-c::defined-fun
       (make-instance 'global-function-description
         :name name
         :type (fun-type fun env)
         :inline (sb-c::defined-fun-inlinep fun)
         :dynamic-extent (leaf-dynamic-extent fun env)))
      (cons
       (make-instance 'local-macro-description
         :name name
         :expander (cdr fun)))
      (null
       (case (sb-int:info :function :kind name)
         (:macro
          (make-instance 'global-macro-description
            :name name
            :expander (sb-int:info :function :macro-function name)))
         (:special-form
          (make-instance 'special-operator-description
            :name name))
         (:function
          (make-instance 'global-function-description
            :name name
            :type (if (eq (sb-int:info :function :where-from name) :declared)
                      (sb-int:proclaimed-ftype name)
                      sb-kernel:*universal-fun-type*)
            :inline (sb-int:info :function :inlinep name))))))))

(defmethod trucler:describe-block ((client native-client) (env null) name)
  (trucler:describe-block client (sb-kernel:make-null-lexenv) name))

(defmethod trucler:describe-block ((client native-client) (env sb-kernel:lexenv) name)
  (let ((found (alist-value name (sb-c::lexenv-blocks env))))
    (if found
        (make-instance 'trucler:block-description
          :name name
          :identity found)
        nil)))

(defmethod trucler:describe-tag ((client native-client) (env null) tag)
  (trucler:describe-tag client (sb-kernel:make-null-lexenv) tag))

(defmethod trucler:describe-tag ((client native-client) (env sb-kernel:lexenv) tag)
  (let ((found (alist-value tag (sb-c::lexenv-tags env))))
    (if found
        (make-instance 'tag-description
          :name tag
          :identity found)
        nil)))

(defmethod trucler:describe-optimize ((client native-client) (env null))
  (trucler:describe-optimize client (sb-kernel:make-null-lexenv)))

(defmethod trucler:describe-optimize ((client native-client) (env sb-kernel:lexenv))
  (let ((policy (or (sb-c::lexenv-policy env)
                    sb-c::*policy*)))
    (make-instance 'optimize-description
      :speed (sb-c::policy-quality policy 'speed)
      :compilation-speed (sb-c::policy-quality policy 'compilation-speed)
      :debug (sb-c::policy-quality policy 'debug)
      :space (sb-c::policy-quality policy 'space)
      :safety (sb-c::policy-quality policy 'safety))))

(defmethod trucler:global-environment
    ((client native-client) (env sb-kernel:lexenv))
  (sb-kernel:make-null-lexenv))

(defmethod trucler:global-environment
    ((client native-client) (env null))
  (sb-kernel:make-null-lexenv))

(defmethod trucler:global-environment-p
    ((client native-client) (env sb-kernel:lexenv))
  (sb-c::null-lexenv-p env))

(defmethod trucler:global-environment-p
    ((client native-client) (env null))
  t)
