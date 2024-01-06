(cl:in-package #:trucler-native-sbcl)

(defmethod trucler:describe-declarations
    ((client client) (environment null))
  (trucler:describe-declarations client *null-lexical-environment*))

(defmethod trucler:describe-declarations
    ((client client) (environment sb-kernel:lexenv))
  (make-instance 'declarations-description
    :declarations (copy-list sb-int:*recognized-declarations*)))
