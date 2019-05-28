(cl:in-package #:trucler)

(defgeneric macro-function (name environment))

(defgeneric compiler-macro-function (name environment))

(defgeneric symbol-macro-expansion (name environment))
