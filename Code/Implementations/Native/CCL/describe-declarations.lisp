(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-declarations ((client client) (env null))
  (describe-declarations))

(defmethod trucler:describe-declarations ((client client)
                                          (env ccl::lexical-environment))
  (describe-declarations))

(defmethod trucler:describe-declarations ((client client)
                                          (env ccl::definition-environment))
  (describe-declarations))

(defun describe-declarations ()
  (make-instance 'declarations-description
    :declarations ccl::*nx-known-declarations*))
