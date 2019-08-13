(cl:in-package #:trucler-native-ccl)

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
    (trucler:global-special-variable-description)
  ())

(defclass constant-variable-description
    (trucler:constant-variable-description)
  ())

(defclass local-symbol-macro-description
    (trucler:local-symbol-macro-description)
  ())

(defclass global-symbol-macro-description
    (trucler:global-symbol-macro-description)
  ())

(defclass global-variable-description
    (trucler:authentic-variable-description)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-DESCRIPTION classes.

(defclass local-function-description
    (trucler:local-function-description)
  ())

(defclass global-function-description
    (trucler:global-function-description)
  ())

(defclass generic-function-description
    (trucler:generic-function-description)
  ())

(defclass local-macro-description
    (trucler:local-macro-description)
  ())

(defclass global-macro-description
    (trucler:global-macro-description)
  ())

(defclass special-operator-description
    (trucler:special-operator-description)
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
