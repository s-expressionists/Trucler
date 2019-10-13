(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-function
    ((client client) (env null) name)
  (trucler:describe-function client *null-lexical-environment* name))

(defmethod trucler:describe-function
    ((client client) (env sb-kernel:lexenv) name)
  (let ((entry (assoc name (sb-c::lexenv-funs env) :test #'equal)))
    (if (not entry)
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
             :inline (sb-int:info :function :inlinep name))))
        (let ((fun (cdr entry)))
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
               :expander (cdr fun))))))))
