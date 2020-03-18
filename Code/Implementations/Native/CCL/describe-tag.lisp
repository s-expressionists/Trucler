(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-tag
    ((client client) (env null) tag)
  (trucler:describe-tag client *null-lexical-environment* tag))

(defmethod trucler:describe-tag
    ((client client) (env ccl::lexical-environment) tag)
  (describe-tag tag))

(defmethod trucler:describe-tag
    ((client client) (env ccl::definition-environment) tag)
  (describe-tag tag))

(defun describe-tag (name)
  (let ((info (ccl::nx-tag-info name)))
    (if (not info)
        nil
        (make-instance 'tag-description
          :name name
          :identity info))))
