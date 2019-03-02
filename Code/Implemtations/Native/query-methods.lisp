(cl:in-package #:trucler)

(defmethod describe-variable (client (environment environment) name)
  (let* ((descriptions (cached-variable-description environment))
         (description (find name descriptions :test #'eq :key #'name)))
    (when (null description)
      (let* ((global-environment (global-environment environment))
             (global-description (describe-variable client global-environment name)))
        (setf description global-description)
        (unless (null global-description)
          ;; Cache the global description locally.
          (reinitialize-instance environment
            :cached-variable-description (cons description descriptions)))))
    description))

(defmethod describe-function (client (environment environment) name)
  (let* ((descriptions (cached-function-description environment))
         (description (find name descriptions :test #'equal :key #'name)))
    (when (null description)
      (let* ((global-environment (global-environment environment))
             (global-description (describe-function client global-environment name)))
        (setf description global-description)
        (unless (null global-description)
          ;; Cache the global description locally.
          (reinitialize-instance environment
            :cached-function-description (cons description descriptions)))))
    description))

(defmethod describe-block (client (environment environment) name)
  (let* ((descriptions (cached-block-description environment)))
    (find name descriptions :test #'eq :key #'name)))

(defmethod describe-tag (client (environment environment) tag)
  (let* ((descriptions (cached-tag-description environment)))
    (find tag descriptions :test #'eql :key #'name)))

(defmethod describe-optimize (client (environment environment))
  (let* ((description (cached-optimize-description environment)))
    (when (null description)
      (let* ((global-environment (global-environment environment))
             (global-description (describe-optimize client global-environment)))
        (setf description global-description)
        (unless (null global-description)
          ;; Cache the global description locally.
          (reinitialize-instance environment
            :cached-optimize-description description))))
    description))
