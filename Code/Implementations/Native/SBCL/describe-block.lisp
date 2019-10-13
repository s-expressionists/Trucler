(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-block
    ((client client) (env null) (name symbol))
  (trucler:describe-block client *null-lexical-environment* name))

(defmethod trucler:describe-block
    ((client client) (env sb-kernel:lexenv) (name symbol))
  (let ((entry (assoc name (sb-c::lexenv-blocks env))))
    (if entry
        (make-instance 'trucler:block-description
          :name name
          :identity (car entry))
        nil)))
