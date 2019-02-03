(cl:in-package #:trucler)

(defgeneric merge-variable-type (info type))

(defgeneric merge-function-type (info type))

(defgeneric merge-variable-ignore (info ignore))

(defgeneric merge-function-ignore (info ignore))

(defgeneric merge-variable-dynamic-extent (info dynamic-extent))

(defgeneric merge-function-dynamic-extent (info dynamic-extent))

(defgeneric merge-inline (info inline))

(defgeneric merge-optimize (info quality value))
