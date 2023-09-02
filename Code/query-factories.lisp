(cl:in-package #:trucler)

(defgeneric lexical-variable-description-class (client)
  (:method (client)
    (declare (cl:ignore client))
    (find-class 'lexical-variable-description)))

(defgeneric local-special-variable-description-class (client)
  (:method (client)
    (declare (cl:ignore client))
    (find-class 'local-special-variable-description)))

(defgeneric local-symbol-macro-description-class (client)
  (:method (client)
    (declare (cl:ignore client))
    (find-class 'local-symbol-macro-description)))

(defgeneric local-function-description-class (client)
  (:method (client)
    (declare (cl:ignore client))
    (find-class 'local-function-description)))

(defgeneric local-macro-description-class (client)
  (:method (client)
    (declare (cl:ignore client))
    (find-class 'local-macro-description)))

(defgeneric block-description-class (client)
  (:method (client)
    (declare (cl:ignore client))
    (find-class 'block-description)))

(defgeneric tag-description-class (client)
  (:method (client)
    (declare (cl:ignore client))
    (find-class 'tag-description)))
