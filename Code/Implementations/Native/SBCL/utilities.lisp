(cl:in-package #:trucler-native-sbcl)

;;; We use this environment whenever the environment argument of a query
;;; function is NIL.
(defparameter *null-lexical-environment*
  (sb-kernel:make-null-lexenv))

(defun leaf-type (leaf env default)
  (sb-kernel:type-specifier
   (sb-kernel:type-intersection
    (sb-c::leaf-type leaf)
    (let ((entry (assoc leaf (sb-c::lexenv-type-restrictions env))))
      (if entry
          (cdr entry)
          default)))))

(defun fun-type (var env)
  (leaf-type var env sb-kernel:*universal-fun-type*))

(defun var-type (var env)
  (leaf-type var env sb-kernel:*universal-type*))

(defun leaf-dynamic-extent (leaf env)
  (declare (ignore env))
  (and (sb-c::leaf-dynamic-extent leaf) t))
