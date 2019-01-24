(cl:in-package #:trucler)

;;; The base class of all INFO classes.
(defclass info () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Mixin classes for better code factoring.

(defclass name-mixin ()
  ((%name :initarg :name :reader name)))

(defclass identity-mixin ()
  ((%identity :initarg :identity :reader identity)))

(defclass type-mixin ()
  ((%type :initform t :initarg :type :reader type)))

(defclass ignore-mixin ()
  ((%ignore :initform nil :initarg :ignore :reader ignore)))

(defclass dynamic-extent-mixin ()
  ((%dynamic-extent :initform nil
                    :initarg :dynamic-extent
                    :reader dynamic-extent)))

(defclass inline-mixin ()
  ((%inline :initform nil :initarg :inline :reader inline
	    :type (member nil inline notinline))))

(defclass ast-mixin ()
  ((%ast :initform nil :initarg :ast :reader ast)))

(defclass compiler-macro-mixin ()
  ((%compiler-macro :initform nil
                    :initarg :compiler-macro
                    :reader compiler-macro)))

(defclass expander-mixin ()
  ((%expander :initarg :expander :reader expander)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-INFO classes.

(defclass variable-info (name-mixin type-mixin) ())

(defclass lexical-variable-info
    (variable-info identity-mixin type-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass special-variable-info (variable-info type-mixin ignore-mixin)
  ((%global-p :initform nil :initarg :global-p :reader global-p)))
  
(defclass constant-variable-info (variable-info name-mixin)
  ((%value :initarg :value :reader value)))

(defclass symbol-macro-info (variable-info name-mixin type-mixin)
  ((%expansion :initarg :expansion :reader expansion)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-INFO classes.

(defclass function-info (name-mixin) ())

(defclass local-function-info
    (function-info identity-mixin type-mixin inline-mixin
     ignore-mixin ast-mixin dynamic-extent-mixin)
  ())

(defclass global-function-info
    (function-info type-mixin inline-mixin compiler-macro-mixin
     ignore-mixin ast-mixin dynamic-extent-mixin)
  ((%class-name :initarg :class-name :reader class-name))
  (:default-initargs :class-name 'function))

(defclass generic-function-info (global-function-info)
  ((%method-class-name :initform 'standard-method
                       :initarg :method-class-name
                       :reader method-class-name))
  (:default-initargs :class-name 'standard-generic-function))

(defclass local-macro-info (function-info expander-mixin)
  ())

(defclass global-macro-info (function-info expander-mixin compiler-macro-mixin)
  ())

(defclass special-operator-info (function-info)
  ())
