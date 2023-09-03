(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-function
    ((client client) (environment null) name)
  (trucler:describe-function client *null-lexical-environment* name))

(defmethod trucler:describe-function
    ((client client) (environment sb-kernel:lexenv) name)
  (let ((entry (assoc name (sb-c::lexenv-funs environment) :test #'equal)))
    (if (null entry)
        (case (sb-int:info :function :kind name)
          (:macro
           (make-instance 'global-macro-description
             :name name
             :expander (sb-int:info :function :macro-function name)
             :inline (sb-int:info :function :inlinep name)))
          (:special-form
           (make-instance 'special-operator-description
             :name name))
          (:function
           (make-instance 'global-function-description
             :name name
             :type (if (eq (sb-int:info :function :where-from name) :declared)
                       (sb-int:global-ftype name)
                       sb-kernel:*universal-fun-type*)
             :inline (sb-int:info :function :inlinep name))))
        (let ((fun (cdr entry)))
          (etypecase fun
            (sb-c::functional
             (make-instance 'local-function-description
               :name name
               :type (fun-type fun environment)
               :identity fun
               :inline (sb-c::functional-inlinep fun)
               :dynamic-extent (leaf-dynamic-extent fun environment)))
            (sb-c::defined-fun
             (make-instance 'global-function-description
               :name name
               :type (fun-type fun environment)
               :inline (sb-c::defined-fun-inlinep fun)
               :dynamic-extent (leaf-dynamic-extent fun environment)))
            (cons
             (make-instance 'local-macro-description
               :name name
               :expander (cdr fun))))))))
