(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-block
    ((client client) (environment null) name)
  (trucler:describe-block client *null-lexical-environment* name))

(defmethod trucler:describe-block
    ((client client) (environment sb-kernel:lexenv) name)
  (let ((entry (assoc name (sb-c::lexenv-blocks environment))))
    (if (null entry)
        nil
        (make-instance 'block-description
          :name name
          :identity (cdr entry)))))
