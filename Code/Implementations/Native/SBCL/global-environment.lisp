(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:global-environment
    ((client client) (env sb-kernel:lexenv))
  *null-lexical-environment*)
