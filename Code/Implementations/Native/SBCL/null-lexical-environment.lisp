(cl:in-package #:trucler-native-sbcl)

;;; Methods for treating the object NIL as a designator for the null
;;; lexical environment.

(defparameter *null-lexical-environment*
  (sb-kernel:make-null-lexenv))

(defmethod trucler:describe-variable
    ((client client) (env null) name)
  (trucler:describe-variable client *null-lexical-environment* name))

(defmethod trucler:describe-function
    ((client client) (env null) name)
  (trucler:describe-function client *null-lexical-environment* name))

(defmethod trucler:describe-block
    ((client client) (env null) name)
  (trucler:describe-block client *null-lexical-environment* name))

(defmethod trucler:describe-tag
    ((client client) (env null) tag)
  (trucler:describe-tag client *null-lexical-environment* tag))

(defmethod trucler:describe-optimize
    ((client client) (env null))
  (trucler:describe-optimize client *null-lexical-environment*))

(defmethod trucler:global-environment
    ((client client) (env null))
  *null-lexical-environment*)

(defmethod trucler:global-environment-p
    ((client client) (env null))
  t)
