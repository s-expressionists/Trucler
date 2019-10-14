(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-block
    ((client client) (env null) (name symbol))
  (trucler:describe-block client *null-lexical-environment* name))
