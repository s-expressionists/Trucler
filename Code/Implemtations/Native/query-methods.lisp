(cl:in-package #:trucler-native)

(defmethod trucler-describe-variable (client (environment environment) name)
  (let* ((descriptions (variable-description environment))
         (description (find name descriptions :test #'eq :key #'trucler:name)))
    (when (null description)
      (let* ((global-environment (global-environment environment))
             (global-description (trucler-describe-variable client global-environment name)))
        (setf description global-description)
        (unless (null global-description)
          ;; Cache the global description locally.
          (reinitialize-instance environment
            :variable-description (cons description descriptions)))))
    description))

(defmethod trucler-describe-function (client (environment environment) name)
  (let* ((descriptions (function-description environment))
         (description (find name descriptions :test #'equal :key #'trucler:name)))
    (when (null description)
      (let* ((global-environment (global-environment environment))
             (global-description (trucler-describe-function client global-environment name)))
        (setf description global-description)
        (unless (null global-description)
          ;; Cache the global description locally.
          (reinitialize-instance environment
            :function-description (cons description descriptions)))))
    description))

(defmethod trucler-describe-block (client (environment environment) name)
  (let* ((descriptions (block-description environment)))
    (find name descriptions :test #'eq :key #'trucler:name)))

(defmethod trucler-describe-tag (client (environment environment) tag)
  (let* ((descriptions (tag-description environment)))
    (find tag descriptions :test #'eql :key #'trucler:name)))

(defmethod trucler-describe-optimize (client (environment environment))
  (let* ((description (optimize-description environment)))
    (when (null description)
      (let* ((global-environment (global-environment environment))
             (global-description (trucler-describe-optimize client global-environment)))
        (setf description global-description)
        (unless (null global-description)
          ;; Cache the global description locally.
          (reinitialize-instance environment
            :optimize-description description))))
    description))
