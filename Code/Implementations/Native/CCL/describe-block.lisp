(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-block
    ((client client) (env null) (name symbol))
  (trucler:describe-block client *null-lexical-environment* name))

(defmethod trucler:describe-block
    ((client client) (env ccl::lexical-environment) (name symbol))
  (describe-block name))

(defmethod trucler:describe-block
    ((client client) (env ccl::definition-environment) (name symbol))
  (describe-block name))

(defun describe-block (name)
  (let ((info (ccl::nx-block-info name)))
    (if (not info)
        nil
        (make-instance 'block-description
          :name name
          :identity info))))
