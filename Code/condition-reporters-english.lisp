(cl:in-package #:trucler)

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-type-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging type information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-ignore-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging ignore information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition undefined-function-referred-to-by-inline-declaration)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Undefined function named ~s~@
                    referred to by INLINE/NOTINLINE declaration"
            (name condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-dynamic-extent-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging dynamic-extent information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-inline-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging inline information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-inline-data)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging inline data ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-speed-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging speed information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-compilation-speed-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging compilation-speed information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-debug-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging debug information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-safety-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging safety information ~s"
            (description condition))))

(defmethod acclimation:report-condition
    ((condition invalid-description-for-merging-space-information)
     stream
     (language acclimation:english))
  (let ((*package* (find-package '#:keyword)))
    (format stream "Invalid description for merging space information ~s"
            (description condition))))
