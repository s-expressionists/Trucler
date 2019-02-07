(cl:in-package #:trucler)

;;; The base class of all INFO classes.
(defclass info () ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Mixin classes for better code factoring.

(defclass name-mixin ()
  ((%name :initarg :name :reader name)))

(defmethod clone-info append ((object name-mixin))
  '((:name name)))

(defclass identity-mixin ()
  ((%identity :initarg :identity :reader identity)))

(defmethod clone-info append ((object identity-mixin))
  `((:identity identity)))

(defclass type-mixin ()
  ((%type :initform t :initarg :type :reader type)))

(defmethod clone-info append ((object type-mixin))
  `((:type type)))

(defclass ignore-mixin ()
  ((%ignore :initform nil :initarg :ignore :reader ignore)))

(defmethod clone-info append ((object ignore-mixin))
  `((:ignore ignore)))

(defclass dynamic-extent-mixin ()
  ((%dynamic-extent :initform nil
                    :initarg :dynamic-extent
                    :reader dynamic-extent)))

(defmethod clone-info append ((object dynamic-extent-mixin))
  `((:dynamic-extent dynamic-extent)))

(defclass ast-mixin ()
  ((%ast :initform nil :initarg :ast :reader ast)))

(defmethod clone-info append ((object ast-mixin))
  `((:ast ast)))

(defclass compiler-macro-mixin ()
  ((%compiler-macro :initform nil
                    :initarg :compiler-macro
                    :reader compiler-macro)))

(defmethod clone-info append ((object compiler-macro-mixin))
  `((:compiler-macro compiler-macro)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-INFO classes.

(defclass variable-info (name-mixin type-mixin) ())

(defclass lexical-variable-info
    (variable-info identity-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass special-variable-info (variable-info)
  ((%global-p :initform nil :initarg :global-p :reader global-p)))
  
(defmethod clone-info append ((object special-variable-info))
  `((:global-p global-p)))

(defclass constant-variable-info (variable-info name-mixin)
  ((%value :initarg :value :reader value)))

(defmethod clone-info append ((object constant-variable-info))
  `((:value value)))

(defclass symbol-macro-info (variable-info name-mixin)
  ((%expansion :initarg :expansion :reader expansion)))

(defmethod clone-info append ((object symbol-macro-info))
  `((:expansion expansion)))

(defclass local-symbol-macro-info (symbol-macro-info ignore-mixin)
  ())

(defclass global-symbol-macro-info (symbol-macro-info ignore-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-INFO classes.

(defclass functionoid-info (name-mixin) ())

(defclass function-info
    (functionoid-info type-mixin ast-mixin dynamic-extent-mixin)
  ((%inline :initform nil :initarg :inline :reader inline
	    :type (member nil cl:inline cl:notinline))))

(defmethod clone-info append ((object function-info))
  `((:inline inline)))

(defclass local-function-info (function-info identity-mixin ignore-mixin)
  ())

(defclass global-function-info (function-info compiler-macro-mixin)
  ((%class-name :initarg :class-name :reader class-name))
  (:default-initargs :class-name 'function))

(defmethod clone-info append ((object global-function-info))
  `((:class-name class-name)))

(defclass generic-function-info (global-function-info)
  ((%method-class-name :initform 'standard-method
                       :initarg :method-class-name
                       :reader method-class-name))
  (:default-initargs :class-name 'standard-generic-function))

(defmethod clone-info append ((object generic-function-info))
  `((:method-class-name method-class-name)))

(defclass macro-info (functionoid-info)
  ((%expander :initarg :expander :reader expander)))

(defmethod clone-info append ((object macro-info))
  `((:expander expander)))

(defclass local-macro-info (macro-info ignore-mixin)
  ())

(defclass global-macro-info (macro-info compiler-macro-mixin)
  ())

(defclass special-operator-info (functionoid-info)
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
