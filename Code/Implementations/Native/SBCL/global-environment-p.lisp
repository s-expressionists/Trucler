(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:global-environment-p
    ((client client) (env sb-kernel:lexenv))
  (sb-c::null-lexenv-p env))
