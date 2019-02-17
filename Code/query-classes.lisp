(cl:in-package #:trucler)

;;; The base class of all INFO classes.
(defclass info () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-INFO classes.

(defclass variable-info (info name-mixin)
  ())

(defclass authentic-variable-info (variable-info type-mixin)
  ())

(defclass lexical-variable-info
    (authentic-variable-info identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass special-variable-info (authentic-variable-info global-p-mixin)
  ())

(defclass constant-variable-info (variable-info value-mixin)
  ())

(defclass symbol-macro-info (variable-info type-mixin expansion-mixin)
  ())

(defclass local-symbol-macro-info (symbol-macro-info ignore-mixin)
  ())

(defclass global-symbol-macro-info (symbol-macro-info)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-INFO classes.

(defclass function-info (info name-mixin) ())

(defclass authentic-function-info (function-info type-mixin inline-mixin)
  ())

(defclass local-function-info
    (authentic-function-info identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass global-function-info
    (authentic-function-info compiler-macro-mixin class-name-mixin)
  ()
  (:default-initargs :class-name 'function))

(defclass generic-function-info (global-function-info method-class-name-mixin)
  ()
  (:default-initargs :class-name 'standard-generic-function))

(defclass macro-info (function-info expander-mixin)
  ())

(defclass local-macro-info (macro-info ignore-mixin)
  ())

(defclass global-macro-info (macro-info compiler-macro-mixin)
  ())

(defclass special-operator-info (function-info)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; BLOCK-INFO class.

(defclass block-info (info name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; TAG-INFO class.

(defclass tag-info (info name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; OPTIMIZE-INFO class.

(defclass optimize-info
    (info speed-mixin compilation-speed-mixin debug-mixin space-mixin safety-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; CLASS-INFO class.

(defclass class-info (info superclass-names-mixin metaclass-name-mixin)
  ())
