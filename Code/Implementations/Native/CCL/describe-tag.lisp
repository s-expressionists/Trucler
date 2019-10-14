(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-tag
    ((client client) (env null) tag)
  (trucler:describe-tag client *null-lexical-environment* tag))
