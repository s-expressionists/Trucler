(in-package #:trucler-native-test)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *client* (make-instance 'trucler-native:native-client)))

(declaim (notinline touch))
(defun touch (x)
  (declare (ignore x))
  (values))

(defmacro assert-lexical-variable
    (name &key (ignore nil) (type t) (dynamic-extent nil) &environment env)
  (let ((description (trucler:describe-variable nil env name)))
    (check-type description trucler:lexical-variable-description)
    (with-accessors ((description-name trucler:name)
                     (description-ignore trucler:ignore)
                     (description-type trucler:type)
                     (description-dynamic-extent trucler:dynamic-extent))
        description
      (assert (eq description-name name))
      (assert (eq description-ignore ignore))
      (assert (subtypep description-type type))
      (assert (eq description-dynamic-extent dynamic-extent))))
  `(touch ,name))

(defmacro assert-global-special-variable
    (name &key (ignore nil) (type t) (dynamic-extent nil) &environment env)
  (let ((description (trucler:describe-variable nil env name)))
    (check-type description trucler:global-special-variable-description)
    (with-accessors ((description-name trucler:name)
                     (description-ignore trucler:ignore)
                     (description-type trucler:type)
                     (description-dynamic-extent trucler:dynamic-extent))
        description
      (assert (eq description-name name))
      (assert (eq description-ignore ignore))
      (assert (subtypep description-type type))
      (assert (eq description-dynamic-extent dynamic-extent))
      (assert (eq description-global-p global-p))))
  `(touch ,name))

(defmacro assert-local-special-variable
    (name &key (ignore nil) (type t) (dynamic-extent nil) &environment env)
  (let ((description (trucler:describe-variable nil env name)))
    (check-type description trucler:local-special-variable-description)
    (with-accessors ((description-name trucler:name)
                     (description-ignore trucler:ignore)
                     (description-type trucler:type)
                     (description-dynamic-extent trucler:dynamic-extent))
        description
      (assert (eq description-name name))
      (assert (eq description-ignore ignore))
      (assert (subtypep description-type type))
      (assert (eq description-dynamic-extent dynamic-extent))))
  `(touch ,name))
