(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-function
    ((client client) (env null) name)
  (trucler:describe-function client *null-lexical-environment* name))
