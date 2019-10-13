(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-variable
    ((client client) (env null) (name symbol))
  (trucler:describe-variable client *null-lexical-environment* name))

(defmethod trucler:describe-variable
    ((client client) (env sb-kernel:lexenv) (name symbol))
  (let ((entry (assoc name (sb-c::lexenv-vars env))))
    (if (not entry)
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
          (:unknown nil))
        (let ((var (cdr entry)))
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
               :expansion (cdr var))))))))
