(cl:in-package #:trucler)

(defgeneric merge-variable-type (variable-information type))

(defgeneric merge-variable-ignore (variable-information ignore))

(defgeneric merge-variable-dynamic-extent (variable-information))

(defgeneric merge-function-type (function-information type))

(defgeneric merge-function-ignore (function-information ignore))

(defgeneric merge-function-dynamic-extent (function-information))

(defgeneric merge-inline (function-information inline))

(defgeneric merge-speed (optimize-information value))

(defgeneric merge-compilation-speed (optimize-information value))

(defgeneric merge-debug (optimize-information value))

(defgeneric merge-space (optimize-information value))

(defgeneric merge-safety (optimize-information value))
