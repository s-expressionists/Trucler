(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-tag
    ((client client) (env null) tag)
  (trucler:describe-tag client *null-lexical-environment* tag))

(defmethod trucler:describe-tag
    ((client client) (env sb-kernel:lexenv) tag)
  (let ((entry (assoc tag (sb-c::lexenv-tags env))))
    (if entry
        (make-instance 'tag-description
          :name tag
          :identity (cdr entry))
        nil)))
