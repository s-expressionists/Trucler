(cl:in-package #:trucler)

(defmethod acclimation:report-condition
    ((condition no-variable-description) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined variable named ~s" (name condition))))

(defmethod acclimation:report-condition
    ((condition no-function-description) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined function named ~s" (name condition))))

(defmethod acclimation:report-condition
    ((condition no-block-description) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined block named ~s" (name condition))))

(defmethod acclimation:report-condition
    ((condition no-tag-description) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined tag named ~s" (name condition))))
