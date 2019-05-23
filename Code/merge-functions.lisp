(cl:in-package #:trucler)

(defgeneric merge-type (client description type))

(defgeneric merge-ignore (client description ignore))

(defgeneric merge-dynamic-extent (client description))

(defgeneric merge-inline (client description inline))

(defgeneric merge-inline-data (client description inline-data))

(defgeneric merge-speed (client description value))

(defgeneric merge-compilation-speed (client description value))

(defgeneric merge-debug (client description value))

(defgeneric merge-space (client description value))

(defgeneric merge-safety (client description value))
