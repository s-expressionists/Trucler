(cl:in-package #:trucler)

(defmethod acclimation:report-condition
    ((condition no-variable-information) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined variable named ~s" (name condition))))

(defmethod acclimation:report-condition
    ((condition no-function-information) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined function named ~s" (name condition))))

(defmethod acclimation:report-condition
    ((condition no-block-information) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined block named ~s" (name condition))))

(defmethod acclimation:report-condition
    ((condition no-tag-information) stream (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined tag named ~s" (name condition))))
