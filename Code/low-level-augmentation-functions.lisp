(cl:in-package #:trucler)

(defgeneric augment-with-variable-information
    (client environment variable-information))

(defgeneric augment-with-function-information
    (client environment function-information))

(defgeneric augment-with-block-information
    (client environment block-information))

(defgeneric augment-with-tag-information
    (client environment tag-information))

(defgeneric augment-with-optimize-information
    (client environment optimize-information))
