(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-optimize
    ((client client) (environment null))
  (trucler:describe-optimize client *null-lexical-environment*))

(defmethod trucler:describe-optimize
    ((client client) (environment sb-kernel:lexenv))
  (let ((policy (or (sb-c::lexenv-%policy environment)
                    sb-c::*policy*)))
    (make-instance 'optimize-description
      :speed (sb-c::policy-quality policy 'speed)
      :compilation-speed (sb-c::policy-quality policy 'compilation-speed)
      :debug (sb-c::policy-quality policy 'debug)
      :space (sb-c::policy-quality policy 'space)
      :safety (sb-c::policy-quality policy 'safety))))
