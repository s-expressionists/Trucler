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

(defclass compiler-macro-mixin ()
  ((%compiler-macro :initform nil
                    :initarg :compiler-macro
                    :reader compiler-macro)))

(defmethod clone-info append ((object compiler-macro-mixin))
  `((:compiler-macro compiler-macro)))

(defclass expansion-mixin ()
  ((%expansion :initarg :expansion :reader expansion)))

(defmethod clone-info append ((object expansion-mixin))
  `((:expansion expansion)))

(defclass expander-mixin ()
  ((%expander :initarg :expander :reader expander)))

(defmethod clone-info append ((object expander))
  `((:expander expander)))

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

(defclass authentic-function-info
    (function-info type-mixin dynamic-extent-mixin)
  ((%inline :initform nil :initarg :inline :reader inline
	    :type (member nil cl:inline cl:notinline))))

(defmethod clone-info append ((object authentic-function-info))
  `((:inline inline)))

(defclass local-function-info (authentic-function-info identity-mixin ignore-mixin)
  ())

(defclass global-function-info (authentic-function-info compiler-macro-mixin)
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
