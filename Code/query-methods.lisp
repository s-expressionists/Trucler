(cl:in-package #:trucler)

(defmethod variable-info (client (environment environment) symbol)
  (let* ((infos (cached-variable-infos environment))
         (info (find symbol infos :test #'eq :key #'name)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-info (variable-info client global-environment symbol)))
        (setf info global-info)
        (unless (null global-info)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-variable-infos (cons info infos)))))
    info))

(defmethod function-info (client (environment environment) symbol)
  (let* ((infos (cached-function-infos environment))
         (info (find symbol infos :test #'equal :key #'name)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-info (function-info client global-environment symbol)))
        (setf info global-info)
        (unless (null global-info)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-function-infos (cons info infos)))))
    info))

(defmethod block-info (client (environment environment) symbol)
  (let* ((infos (cached-block-infos environment)))
    (find symbol infos :test #'eq :key #'name)))

(defmethod tag-info (client (environment environment) symbol)
  (let* ((infos (cached-tag-infos environment)))
    (find symbol infos :test #'eql :key #'name)))

(defmethod optimize-info (client (environment environment))
  (let* ((info (cached-optimize-info environment)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-info (optimize-info client global-environment)))
        (setf info global-info)
        (unless (null global-info)
          ;; Cache the global info locally.
          (reinitialize-instance environment
            :cached-optimize-info info))))
    info))
