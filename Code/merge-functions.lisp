(cl:in-package #:trucler)

(defgeneric merge-variable-type (client variable-information type))

(defgeneric merge-variable-ignore (client variable-information ignore))

(defgeneric merge-variable-dynamic-extent (client variable-information))

(defgeneric merge-function-type (client function-information type))

(defgeneric merge-function-ignore (client function-information ignore))

(defgeneric merge-function-dynamic-extent (client function-information))

(defgeneric merge-inline (client function-information inline))

(defgeneric merge-speed (client optimize-information value))

(defgeneric merge-compilation-speed (client optimize-information value))

(defgeneric merge-debug (client optimize-information value))

(defgeneric merge-space (client optimize-information value))

(defgeneric merge-safety (client optimize-information value))
