(cl:in-package #:trucler-native)

(defmethod trucler:global-environment
    ((client client) (env null))
  nil)

(defmethod trucler:global-environment-p
    ((client client) (env null))
  t)
