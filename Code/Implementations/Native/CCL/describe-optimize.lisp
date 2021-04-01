(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-declaration
    ((client client) (env null) identifier)
  (describe-declaration *null-lexical-environment* identifier))

(defmethod trucler:describe-declaration
    ((client client) (env ccl::lexical-environment) (id (eql 'cl:optimize)))
  (describe-optimize env))

(defmethod trucler:describe-declaration
    ((client client) (env ccl::lexical-environment) (id (eql 'cl:declaration)))
  (make-instance 'declarations-description
    :declarations ccl::*nx-known-declarations*))

(defmethod trucler:describe-declaration
    ((client client) (env ccl::lexical-environment) identifier)
  (if (member identifier ccl::*nx-known-declarations*)
      (make-instance 'user-declaration-description :name identifier)
      nil))

(defmethod trucler:describe-declaration
    ((client client) (env ccl::definition-environment) identifier)
  (declare (ignore identifier))
  nil)

(defun describe-optimize (env)
  (make-instance 'optimize-description
    :speed (ccl::speed-optimize-quantity env)
    :compilation-speed (ccl::compilation-speed-optimize-quantity env)
    :debug (ccl::debug-optimize-quantity env)
    :space (ccl::space-optimize-quantity env)
    :safety (ccl::safety-optimize-quantity env)))
