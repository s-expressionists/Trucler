(cl:in-package #:trucler)

(defgeneric merge-type (client information type))

(defgeneric merge-ignore (client information ignore))

(defgeneric merge-dynamic-extent (client information))

(defgeneric merge-inline (client information inline))

(defgeneric merge-speed (client information value))

(defgeneric merge-compilation-speed (client information value))

(defgeneric merge-debug (client information value))

(defgeneric merge-space (client information value))

(defgeneric merge-safety (client information value))
