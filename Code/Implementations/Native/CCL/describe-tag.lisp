(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-tag
    ((client client) (environment null) name)
  (trucler:describe-tag client *null-lexical-environment* name))

(defmethod trucler:describe-tag
    ((client client) (environment ccl::lexical-environment) name)
  (describe-tag name))

(defmethod trucler:describe-tag
    ((client client) (environment ccl::definition-environment) name)
  (describe-tag name))

(defun describe-tag (name)
  (let ((info (ccl::nx-tag-info name)))
    (if (null info)
        nil
        (make-instance 'tag-description
          :name name
          :identity info))))
