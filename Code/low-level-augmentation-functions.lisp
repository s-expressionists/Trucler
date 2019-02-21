(cl:in-package #:trucler)

(defgeneric augment-with-variable-description
    (client environment variable-description))

(defgeneric augment-with-function-description
    (client environment function-description))

(defgeneric augment-with-block-description
    (client environment block-description))

(defgeneric augment-with-tag-description
    (client environment tag-description))

(defgeneric augment-with-optimize-description
    (client environment optimize-description))
