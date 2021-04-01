(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-declaration
    ((client client) (env null) identifier)
  (trucler:describe-declaration client *null-lexical-environment* identifier))

(defmethod trucler:describe-declaration
    ((client client) (env sb-kernel:lexenv) (id (eql 'cl:optimize)))
  (let ((policy (or (sb-c::lexenv-policy env)
                    sb-c::*policy*)))
    (make-instance 'optimize-description
      :speed (sb-c::policy-quality policy 'speed)
      :compilation-speed (sb-c::policy-quality policy 'compilation-speed)
      :debug (sb-c::policy-quality policy 'debug)
      :space (sb-c::policy-quality policy 'space)
      :safety (sb-c::policy-quality policy 'safety))))

(defmethod trucler:describe-declaration
    ((client client) (env sb-kernel:lexenv) (id (eql 'cl:declaration)))
  (make-instance 'declarations-description
    :declarations (copy-list sb-int:*recognized-declarations*)))

(defmethod trucler:describe-declaration
    ((client client) (env sb-kernel:lexenv) identifier)
  (if (member identifier sb-int:*recognized-declarations*)
      (make-instance 'user-declaration-description
        :name identifier)
      nil))
