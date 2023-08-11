(cl:in-package #:trucler-native-sbcl)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Class accessors.

(defgeneric always-bound (description))

(defgeneric deprecated (description))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Mixin classes.

(trucler:define-mixin-class always-bound-mixin
  %always-bound :always-bound always-bound
  :initform nil)

(trucler:define-mixin-class deprecated-mixin
  %deprecated :deprecated deprecated
  :initform '())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-DESCRIPTION classes.

(defclass lexical-variable-description
    (trucler:lexical-variable-description)
  ())

(defclass local-special-variable-description
    (trucler:local-special-variable-description)
  ())

(defclass global-special-variable-description
    (trucler:global-special-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass global-variable-description
    (trucler:authentic-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass constant-variable-description
    (trucler:constant-variable-description
     deprecated-mixin)
  ())

(defclass local-symbol-macro-description
    (trucler:local-symbol-macro-description)
  ())

(defclass global-symbol-macro-description
    (trucler:global-symbol-macro-description
     deprecated-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-DESCRIPTION classes.

(defclass local-function-description
    (trucler:local-function-description)
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
    (trucler:local-macro-description)
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
