(in-package #:trucler-native-test)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *client* (make-instance 'trucler-native:client)))

(declaim (notinline touch))
(defun touch (x)
  (declare (ignore x))
  (values))

(defun boolean= (a b)
  (if (not a)
      (not b)
      (and b t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Variables

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
    (check-type description trucler:constant-variable-description)
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

(defmacro assert-local-symbol-macro-description
    (name &key (expansion nil expansion-p) &environment env)
  (let ((description (trucler:describe-variable *client* env name)))
    (check-type description trucler:local-symbol-macro-description)
    (when expansion-p
      (assert (equal expansion (trucler:expansion description))))
    `(values)))

(defmacro assert-global-symbol-macro-description
    (name &key (expansion nil expansion-p) &environment env)
  (let ((description (trucler:describe-variable *client* env name)))
    (check-type description trucler:global-symbol-macro-description)
    (when expansion-p
      (assert (equal expansion (trucler:expansion description))))
    `(values)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions

(defmacro assert-local-function-description
    (name &environment env)
  (let ((description (trucler:describe-function *client* env name)))
    (check-type description trucler:local-function-description)
    `(touch #',name)))

(defmacro assert-global-function-description
    (name &environment env)
  (let ((description (trucler:describe-function *client* env name)))
    (check-type description trucler:global-function-description)
    `(touch #',name)))

(defmacro assert-local-macro-description
    (name &environment env)
  (let ((description (trucler:describe-function *client* env name)))
    (check-type description trucler:local-macro-description)
    `(values)))

(defmacro assert-global-macro-description
    (name &environment env)
  (let ((description (trucler:describe-function *client* env name)))
    (check-type description trucler:global-macro-description)
    (assert (functionp (trucler:expander description)))
    `(values)))

(defmacro assert-special-operator-description
    (name &environment env)
  (let ((description (trucler:describe-function *client* env name)))
    (check-type description trucler:special-operator-description)
    (assert (functionp (trucler:expander description)))
    `(values)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Miscellaneous

(defmacro assert-block-description
    (name &environment env)
  (let ((description (trucler:describe-block *client* env name)))
    (check-type description trucler:block-description)
    `(values)))

(defmacro assert-tag-description
    (tag &environment env)
  (let ((description (trucler:describe-tag *client* env tag)))
    (check-type description trucler:tag-description)
    `(values)))

(defmacro assert-optimize-description
    (&key (speed nil speed-p)
       (compilation-speed nil compilation-speed-p)
       (debug nil debug-p)
       (space nil space-p)
       (safety nil safety-p)
     &environment env)
  (let ((description (trucler:describe-declaration *client* env 'cl:optimize)))
    (check-type description trucler:optimize-description)
    (when speed-p
      (assert (= (trucler:speed description) speed)))
    (when compilation-speed-p
      (assert (= (trucler:compilation-speed description) compilation-speed)))
    (when debug-p
      (assert (= (trucler:debug description) debug)))
    (when space-p
      (assert (= (trucler:space description) space)))
    (when safety-p
      (assert (= (trucler:safety description) safety)))
    `(values)))
