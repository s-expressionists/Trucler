(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-optimize
    ((client client) (env null))
  (describe-optimize *null-lexical-environment*))

(defmethod trucler:describe-optimize
    ((client client) (env ccl::lexical-environment))
  (describe-optimize env))

(defmethod trucler:describe-optimize
    ((client client) (env ccl::definition-environment))
  nil)

(defun describe-optimize (env)
  (make-instance 'optimize-description
    :speed (ccl::speed-optimize-quantity env)
    :compilation-speed (ccl::compilation-speed-optimize-quantity env)
    :debug (ccl::debug-optimize-quantity env)
    :space (ccl::space-optimize-quantity env)
    :safety (ccl::safety-optimize-quantity env)))
