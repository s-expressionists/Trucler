(cl:in-package #:trucler)

;;; The base class of all INFO classes.
(defclass info () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-INFO classes.

(defclass variable-info (name-mixin)
  ())

(defclass authentic-variable-info (variable-info type-mixin)
  ())

(defclass lexical-variable-info
    (authentic-variable-info identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass special-variable-info (authentic-variable-info)
  ((%global-p :initform nil :initarg :global-p :reader global-p)))
  
(defmethod clone-info append ((object special-variable-info))
  `((:global-p global-p)))

(defclass constant-variable-info (variable-info)
  ((%value :initarg :value :reader value)))

(defmethod clone-info append ((object constant-variable-info))
  `((:value value)))

(defclass symbol-macro-info (variable-info type-mixin expansion-mixin)
  ())

(defclass local-symbol-macro-info (symbol-macro-info ignore-mixin)
  ())

(defclass global-symbol-macro-info (symbol-macro-info)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-INFO classes.

(defclass function-info (name-mixin) ())

(defclass authentic-function-info (function-info type-mixin inline-mixin)
  ())

(defclass local-function-info
    (authentic-function-info identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass global-function-info
    (authentic-function-info compiler-macro-mixin class-name-mixin)
  ()
  (:default-initargs :class-name 'function))

(defclass generic-function-info (global-function-info)
  ((%method-class-name :initform 'standard-method
                       :initarg :method-class-name
                       :reader method-class-name))
  (:default-initargs :class-name 'standard-generic-function))

(defmethod clone-info append ((object generic-function-info))
  `((:method-class-name method-class-name)))

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

(defclass block-info (name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; TAG-INFO class.

(defclass tag-info (name-mixin identity-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; OPTIMIZE-INFO class.

(defclass optimize-info ()
  ((%speed :initarg :speed :reader speed)
   (%compilation-speed :initarg :compilation-speed :reader compilation-speed)
   (%debug :initarg :debug :reader debug)
   (%space :initarg :space :reader space)
   (%safety :initarg :safety :reader safety)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; CLASS-INFO class.

(defclass class-info ()
  ((%superclass-names :initarg :superclass-names :reader superclass-names)
   (%metaclass-name :initarg :metaclass-name :reader metaclass-name)))
