(cl:in-package #:trucler)

;;; The base class of all INFO classes.
(defclass info () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-INFORMATION classes.

(defclass variable-information (info name-mixin)
  ())

(defclass authentic-variable-information (variable-information type-mixin)
  ())

(defclass lexical-variable-information
    (authentic-variable-information identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass special-variable-information (authentic-variable-information global-p-mixin)
  ())

(defclass constant-variable-information (variable-information value-mixin)
  ())

(defclass symbol-macro-information (variable-information type-mixin expansion-mixin)
  ())

(defclass local-symbol-macro-information (symbol-macro-information ignore-mixin)
  ())

(defclass global-symbol-macro-information (symbol-macro-information)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-INFORMATION classes.

(defclass function-information (info name-mixin) ())

(defclass authentic-function-information (function-information type-mixin inline-mixin)
  ())

(defclass local-function-information
    (authentic-function-information identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass global-function-information
    (authentic-function-information compiler-macro-mixin class-name-mixin)
  ()
  (:default-initargs :class-name 'function))

(defclass generic-function-information (global-function-information method-class-name-mixin)
  ()
  (:default-initargs :class-name 'standard-generic-function))

(defclass macro-information (function-information expander-mixin)
  ())

(defclass local-macro-information (macro-information ignore-mixin)
  ())

(defclass global-macro-information (macro-information compiler-macro-mixin)
  ())

(defclass special-operator-information (function-information)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; BLOCK-INFORMATION class.

(defclass block-information (info name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; TAG-INFORMATION class.

(defclass tag-information (info name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; OPTIMIZE-INFORMATION class.

(defclass optimize-information
    (info speed-mixin compilation-speed-mixin debug-mixin space-mixin safety-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; CLASS-INFORMATION class.

(defclass class-information (info name-mixin superclass-names-mixin metaclass-name-mixin)
  ())
