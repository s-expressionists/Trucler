(cl:in-package #:trucler)

(defmethod variable-info (client (environment environment) symbol)
  (let* ((infos (variable-infos environment))
         (info (find symbol infos :test #'eq :key #'name)))
    (when (null info)
      (let* ((global-environment (global-environment environment))
             (global-info (variable-info client global-environment symbol)))
        (setf info global-info)
        (unless (null global-info)
          ;; Cache the global info locally.
          (reinitialize-instance environment
                                 :variable-infos (cons info infos)))))
    info))

    
