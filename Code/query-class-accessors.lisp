(cl:in-package #:trucler)

(defgeneric name (info-instance))

(defgeneric identity (info-instance))

(defgeneric type (info-instance))

(defgeneric inline (info-instance))

(defgeneric ignore (info-instance))

(defgeneric dynamic-extent (info-instance))

(defgeneric ast (info-instance))

(defgeneric compiler-macro (info-instance))

(defgeneric expander (info-instance))

(defgeneric global-p (info-instance))

(defgeneric value (info-instance))

(defgeneric expansion (info-instance))

(defgeneric class-name (info-instance))

(defgeneric method-class-name (info-instance))
