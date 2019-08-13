(cl:in-package #:trucler)

(defgeneric make-environment-builder
    (client environment))

(defgeneric finalize-environment-builder
    (client environment-builder))
