(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-declarations
    ((client client) (environment null))
  (describe-declarations))

(defmethod trucler:describe-declarations
    ((client client) (environment ccl::lexical-environment))
  (describe-declarations))

(defmethod trucler:describe-declarations
    ((client client) (environment ccl::definition-environment))
  (describe-declarations))

(defun describe-declarations ()
  (make-instance 'declarations-description
    :declarations ccl::*nx-known-declarations*))
