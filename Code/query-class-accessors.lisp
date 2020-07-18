(cl:in-package #:trucler)

(defgeneric name (description))

(defgeneric identity (description))

(defgeneric type (description))

(defgeneric inline (description))

(defgeneric ignore (description))

(defgeneric dynamic-extent (description))

(defgeneric compiler-macro (description))

(defgeneric expander (description))

(defgeneric value (description))

(defgeneric expansion (description))

(defgeneric class-name (description))
