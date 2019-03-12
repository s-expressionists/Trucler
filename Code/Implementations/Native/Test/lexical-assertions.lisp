(in-package #:trucler-native-test)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *client* (make-instance 'trucler-native:native-client)))

(declaim (notinline touch))
(defun touch (x)
  (declare (ignore x))
  (values))

(defun boolean= (a b)
  (if (not a)
      (not b)
      (and b t)))

(defmacro assert-lexical-variable
    (name &key (ignore nil) (type t) (dynamic-extent nil) &environment env)
  (let ((description (trucler:describe-variable *client* env name)))
    (check-type description trucler:lexical-variable-description)
    (with-accessors ((description-name trucler:name)
                     (description-ignore trucler:ignore)
                     (description-type trucler:type)
                     (description-dynamic-extent trucler:dynamic-extent))
        description
      (assert (eq description-name name))
      (assert (eq description-ignore ignore))
      (assert (subtypep description-type type))
      (assert (boolean= description-dynamic-extent dynamic-extent))))
  (unless (eq ignore 'cl:ignore)
    `(touch ,name)))

(defmacro assert-local-special-variable
    (name &key (ignore nil) (type t) &environment env)
  (let ((description (trucler:describe-variable *client* env name)))
    (check-type description trucler:local-special-variable-description)
    (with-accessors ((description-name trucler:name)
                     (description-ignore trucler:ignore)
                     (description-type trucler:type))
        description
      (assert (eq description-name name))
      (assert (eq description-ignore ignore))
      (assert (subtypep description-type type))))
  (unless (eq ignore 'cl:ignore)
    `(touch ,name)))

(defmacro assert-global-special-variable
    (name &key (ignore nil) (type t) &environment env)
  (let ((description (trucler:describe-variable *client* env name)))
    (check-type description trucler:global-special-variable-description)
    (with-accessors ((description-name trucler:name)
                     (description-ignore trucler:ignore)
                     (description-type trucler:type))
        description
      (assert (eq description-name name))
      (assert (eq description-ignore ignore))
      (assert (subtypep description-type type))))
  (unless (eq ignore 'cl:ignore)
    `(touch ,name)))

(defmacro assert-constant-variable
    (name &key (ignore nil) (value nil value-p) &environment env)
  (let ((description (trucler:describe-variable *client* env name)))
    (check-type description trucler:global-special-variable-description)
    (with-accessors ((description-name trucler:name)
                     (description-ignore trucler:ignore)
                     (description-value trucler:value))
        description
      (assert (eq description-name name))
      (assert (eq description-ignore ignore))
      (when value-p
        (assert (eql description-value value)))))
  (unless (eq ignore 'cl:ignore)
    `(touch ,name)))
