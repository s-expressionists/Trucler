(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-tag
    ((client client) (environment null) name)
  (trucler:describe-tag client *null-lexical-environment* name))

(defmethod trucler:describe-tag
    ((client client) (environment sb-kernel:lexenv) name)
  (let ((entry (assoc name (sb-c::lexenv-tags environment) :test #'eq)))
    (if (null entry)
        nil
        (make-instance 'tag-description
          :name name
          :identity (cdr entry)))))
