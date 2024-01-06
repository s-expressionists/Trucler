(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-optimize
    ((client client) (environment null))
  (describe-optimize *null-lexical-environment*))

(defmethod trucler:describe-optimize
    ((client client) (environment ccl::lexical-environment))
  (describe-optimize environment))

(defmethod trucler:describe-optimize
    ((client client) (environment ccl::definition-environment))
  nil)

(defun describe-optimize (environment)
  (make-instance 'optimize-description
    :speed (ccl::speed-optimize-quantity environment)
    :compilation-speed (ccl::compilation-speed-optimize-quantity environment)
    :debug (ccl::debug-optimize-quantity environment)
    :space (ccl::space-optimize-quantity environment)
    :safety (ccl::safety-optimize-quantity environment)))
