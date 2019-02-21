(cl:in-package #:trucler)

(defgeneric cloning-information (object)
  (:method-combination append :most-specific-last))
