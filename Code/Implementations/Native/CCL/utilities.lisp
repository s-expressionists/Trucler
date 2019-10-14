(cl:in-package #:trucler-native-ccl)

;;; We use this environment whenever the environment argument of a query
;;; function is NIL.

(defparameter *null-lexical-environment*
  (ccl::new-definition-environment))
