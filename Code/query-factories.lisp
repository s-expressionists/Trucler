(cl:in-package #:trucler)

(defgeneric lexical-variable-description-class (client)
  (:method (client)
    (find-class 'lexical-variable-description)))

(defgeneric special-variable-description-class (client)
  (:method (client)
    (find-class 'special-variable-description)))

(defgeneric local-symbol-macro-description-class (client)
  (:method (client)
    (find-class 'local-symbol-macro-description)))
