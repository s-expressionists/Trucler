(cl:in-package #:trucler)

;;; The base class of all INFO classes.
(defclass description () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-DESCRIPTION classes.

(defclass variable-description (description name-mixin ignore-mixin)
  ())

(defclass authentic-variable-description
    (variable-description type-mixin dynamic-extent-mixin)
  ())

(defclass lexical-variable-description
    (authentic-variable-description identity-mixin)
  ())

(defclass special-variable-description (authentic-variable-description)
  ())

(defclass local-special-variable-description (special-variable-description)
  ())

(defclass global-special-variable-description (special-variable-description)
  ())

(defclass constant-variable-description (variable-description value-mixin)
  ())

(defclass symbol-macro-description (variable-description type-mixin expansion-mixin)
  ())

(defclass local-symbol-macro-description (symbol-macro-description)
  ())

(defclass global-symbol-macro-description (symbol-macro-description)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-DESCRIPTION classes.

(defclass function-description (description name-mixin) ())

(defclass authentic-function-description (function-description type-mixin inline-mixin)
  ())

(defclass local-function-description
    (authentic-function-description identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass global-function-description
    (authentic-function-description compiler-macro-mixin class-name-mixin)
  ()
  (:default-initargs :class-name 'function))

(defclass generic-function-description (global-function-description method-class-name-mixin)
  ()
  (:default-initargs :class-name 'standard-generic-function))

(defclass macro-description (function-description expander-mixin)
  ())

(defclass local-macro-description (macro-description ignore-mixin)
  ())

(defclass global-macro-description (macro-description compiler-macro-mixin)
  ())

(defclass special-operator-description (function-description)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; BLOCK-DESCRIPTION class.

(defclass block-description (description name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; TAG-DESCRIPTION class.

(defclass tag-description (description name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; OPTIMIZE-DESCRIPTION class.

(defclass optimize-description
    (description speed-mixin compilation-speed-mixin debug-mixin space-mixin safety-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; CLASS-DESCRIPTION class.

(defclass class-description (description name-mixin superclass-names-mixin metaclass-name-mixin)
  ())
