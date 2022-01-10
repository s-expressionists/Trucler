(cl:in-package #:trucler)

(defgeneric lexical-variable-description-class (client)
  (:method (client)
    (find-class 'lexical-variable-description)))
