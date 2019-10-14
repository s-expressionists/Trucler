(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-optimize
    ((client client) (env null))
  (trucler:describe-optimize client *null-lexical-environment*))
