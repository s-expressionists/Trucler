(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-block
    ((client client) (environment null) name)
  (trucler:describe-block client *null-lexical-environment* name))

(defmethod trucler:describe-block
    ((client client) (environment ccl::lexical-environment) name)
  (describe-block name))

(defmethod trucler:describe-block
    ((client client) (environment ccl::definition-environment) name)
  (describe-block name))

(defun describe-block (name)
  (let ((info (ccl::nx-block-info name)))
    (if (null info)
        nil
        (make-instance 'block-description
          :name name
          :identity info))))
