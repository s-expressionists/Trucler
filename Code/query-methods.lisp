(cl:in-package #:trucler)

(defmethod variable-information (client (environment environment) variable-name)
  (let* ((infos (cached-variable-information environment))
         (info (find variable-name infos :test #'eq :key #'name)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-information (variable-information client global-environment variable-name)))
        (setf info global-information)
        (unless (null global-information)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-variable-information (cons info infos)))))
    info))

(defmethod function-information (client (environment environment) function-name)
  (let* ((infos (cached-function-information environment))
         (info (find function-name infos :test #'equal :key #'name)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-information (function-information client global-environment function-name)))
        (setf info global-information)
        (unless (null global-information)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-function-information (cons info infos)))))
    info))

(defmethod block-information (client (environment environment) block-name)
  (let* ((infos (cached-block-information environment)))
    (find block-name infos :test #'eq :key #'name)))

(defmethod tag-information (client (environment environment) tag-name)
  (let* ((infos (cached-tag-information environment)))
    (find tag-name infos :test #'eql :key #'name)))

(defmethod optimize-information (client (environment environment))
  (let* ((info (cached-optimize-information environment)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-information (optimize-information client global-environment)))
        (setf info global-information)
        (unless (null global-information)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-optimize-information info))))
    info))
