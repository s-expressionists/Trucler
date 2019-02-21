(cl:in-package #:trucler)

(defgeneric clone-object (object)
  (:method-combination append :most-specific-last))
