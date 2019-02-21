(cl:in-package #:trucler)

;;; The base class of all INFO classes.
(defclass info () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-DESCRIPTION classes.

(defclass variable-description (info name-mixin)
  ())

(defclass authentic-variable-description (variable-description type-mixin)
  ())

(defclass lexical-variable-description
    (authentic-variable-description identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass special-variable-description (authentic-variable-description global-p-mixin)
  ())

(defclass constant-variable-description (variable-description value-mixin)
  ())

(defclass symbol-macro-description (variable-description type-mixin expansion-mixin)
  ())

(defclass local-symbol-macro-description (symbol-macro-description ignore-mixin)
  ())

(defclass global-symbol-macro-description (symbol-macro-description)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-DESCRIPTION classes.

(defclass function-description (info name-mixin) ())

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

(defclass block-description (info name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; TAG-DESCRIPTION class.

(defclass tag-description (info name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; OPTIMIZE-DESCRIPTION class.

(defclass optimize-description
    (info speed-mixin compilation-speed-mixin debug-mixin space-mixin safety-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; CLASS-DESCRIPTION class.

(defclass class-description (info name-mixin superclass-names-mixin metaclass-name-mixin)
  ())
