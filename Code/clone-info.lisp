(cl:in-package #:trucler)

(defgeneric clone-info (object)
  (:method-combination append :most-specific-last))
