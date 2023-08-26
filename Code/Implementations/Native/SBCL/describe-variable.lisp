(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-variable
    ((client client) (environment null) name)
  (trucler:describe-variable client *null-lexical-environment* name))

(defmethod trucler:describe-variable
    ((client client) (environment sb-kernel:lexenv) name)
  (let ((entry (assoc name (sb-c::lexenv-vars environment) :test #'eq)))
    (if (null entry)
        (ecase (sb-int:info :variable :kind name)
          (:special
           (make-instance 'global-special-variable-description
             :name name
             :type (global-var-type name)
             :always-bound (var-always-bound name)
             :deprecated (var-deprecated name)))
          (:global
           (make-instance 'global-variable-description
             :name name
             :type (global-var-type name)
             :always-bound (var-always-bound name)
             :deprecated (var-deprecated name)))
          (:constant
           (make-instance 'constant-variable-description
             :name name
             :value (symbol-value name)
             :deprecated (var-deprecated name)))
          (:macro
           (make-instance 'global-symbol-macro-description
             :name name
             :type (global-var-type name)
             :expansion (sb-int:info :variable :macro-expansion name)
             :deprecated (var-deprecated name)))
          (:unknown nil))
        (let ((var (cdr entry)))
          (etypecase var
            (sb-c::lambda-var
             (make-instance 'lexical-variable-description
               :name name
               :type (var-type var environment)
               :identity var
               :dynamic-extent (leaf-dynamic-extent var environment)
               :ignore (cond ((sb-c::lambda-var-ignorep var)
                              'cl:ignore)
                             ((sb-c::leaf-ever-used var)
                              'cl:ignorable)
                             (t nil))))
            (sb-c::global-var
             ;; SBCL does not seem to store dynamic-extent information
             ;; for these.
             (ecase (sb-c::global-var-kind var)
               (:special
                (make-instance 'local-special-variable-description
                  :name name
                  :type (var-type var environment)))
               (:global
                (make-instance 'global-variable-description
                  :name name
                  :type (var-type var environment)))
               (:unknown nil)))
            (sb-c::constant
             (make-instance 'constant-variable-description
               :name name
               :value (sb-c::constant-value var)))
            (cons
             (let ((expansion (cdr var)))
               (make-instance 'local-symbol-macro-description
                 :name name
                 :type (if (and (listp expansion)
                                (eq (first expansion) 'the))
                           (second expansion)
                           t)
                 :expansion expansion))))))))
