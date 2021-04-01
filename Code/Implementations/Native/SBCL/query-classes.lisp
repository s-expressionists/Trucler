(cl:in-package #:trucler-native-sbcl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Mixin classes.

(defclass always-bound-mixin ()
  ((%always-bound
    :initarg :always-bound
    :initform nil
    :reader always-bound
    :type boolean)))

(defclass deprecated-mixin ()
  ((%deprecated
    :initarg :deprecated
    :initform '()
    :reader deprecated)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-DESCRIPTION classes.

(defclass lexical-variable-description
    (trucler:lexical-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass local-special-variable-description
    (trucler:local-special-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass global-special-variable-description
    (trucler:global-special-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass constant-variable-description
    (trucler:constant-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass local-symbol-macro-description
    (trucler:local-symbol-macro-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass global-symbol-macro-description
    (trucler:global-symbol-macro-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass global-variable-description
    (trucler:authentic-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-DESCRIPTION classes.

(defclass local-function-description
    (trucler:local-function-description
     deprecated-mixin)
  ())

(defclass global-function-description
    (trucler:global-function-description
     deprecated-mixin)
  ())

(defclass generic-function-description
    (trucler:generic-function-description
     deprecated-mixin)
  ())

(defclass local-macro-description
    (trucler:local-macro-description
     deprecated-mixin)
  ())

(defclass global-macro-description
    (trucler:global-macro-description
     deprecated-mixin)
  ())

(defclass special-operator-description
    (trucler:special-operator-description
     deprecated-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Other description classes.

(defclass block-description
    (trucler:block-description)
  ())

(defclass tag-description
    (trucler:tag-description)
  ())

(defclass optimize-description
    (trucler:optimize-description)
  ())

(defclass declarations-description
    (trucler:declarations-description)
  ())

(defclass user-declaration-description
    (trucler:user-declaration-description)
  ())
