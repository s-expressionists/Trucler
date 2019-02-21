(cl:in-package #:trucler)

(defmethod describe-variable (client (environment environment) variable-name)
  (let* ((infos (cached-variable-description environment))
         (info (find variable-name infos :test #'eq :key #'name)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-description (describe-variable client global-environment variable-name)))
        (setf info global-description)
        (unless (null global-description)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-variable-description (cons info infos)))))
    info))

(defmethod describe-function (client (environment environment) function-name)
  (let* ((infos (cached-function-description environment))
         (info (find function-name infos :test #'equal :key #'name)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-description (describe-function client global-environment function-name)))
        (setf info global-description)
        (unless (null global-description)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-function-description (cons info infos)))))
    info))

(defmethod describe-block (client (environment environment) block-name)
  (let* ((infos (cached-block-description environment)))
    (find block-name infos :test #'eq :key #'name)))

(defmethod describe-tag (client (environment environment) tag-name)
  (let* ((infos (cached-tag-description environment)))
    (find tag-name infos :test #'eql :key #'name)))

(defmethod describe-optimize (client (environment environment))
  (let* ((info (cached-optimize-description environment)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-description (describe-optimize client global-environment)))
        (setf info global-description)
        (unless (null global-description)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-optimize-description info))))
    info))
