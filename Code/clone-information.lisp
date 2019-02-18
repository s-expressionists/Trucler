(cl:in-package #:trucler)

(defgeneric clone-information (object)
  (:method-combination append :most-specific-last))
