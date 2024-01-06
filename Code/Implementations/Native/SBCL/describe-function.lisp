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
             :compiler-macro (sb-int:info :function :compiler-macro-function name)
             :inline (sb-int:info :function :inlinep name)
             :deprecated (fun-deprecated name)))
          (:special-form
           (make-instance 'special-operator-description
             :name name
             :deprecated (fun-deprecated name)))
          (:function
           (make-instance 'global-function-description
             :name name
             :type (sb-kernel:type-specifier
                    (if (or (typep (sb-int:info :function :source-transform name)
                                   '(cons sb-kernel:defstruct-description))
                            (eq (sb-int:info :function :where-from name) :declared))
                        (sb-int:global-ftype name)
                        sb-kernel:*universal-fun-type*))
             :compiler-macro (sb-int:info :function :compiler-macro-function name)
             :inline (sb-int:info :function :inlinep name)
             :deprecated (fun-deprecated name))))
        (let ((fun (cdr entry)))
          (etypecase fun
            (sb-c::functional
             (make-instance 'local-function-description
               :name name
               :type (fun-type fun environment)
               :identity fun
               :inline (sb-c::functional-inlinep fun)
               :ignore (cond ((sb-c::functional-ignore fun)
                              'cl:ignore)
                             ((sb-c::leaf-ever-used fun)
                              'cl:ignorable)
                             (t nil))
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
