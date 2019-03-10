(cl:in-package #:trucler-native)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Mixin classes.

(defclass always-bound-mixin ()
  ((%always-bound
    :initarg :always-bound
    :initform nil
    :reader always-bound
    :type boolean)))

(defclass deprecated-mixin ()
  ((%deprecated
    :initarg :deprecated
    :initform '()
    :reader deprecated)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-DESCRIPTION classes.

(defclass sbcl-lexical-variable-description
    (trucler:lexical-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass sbcl-local-special-variable-description
    (trucler:special-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass sbcl-global-special-variable-description
    (trucler:special-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass sbcl-constant-variable-description
    (trucler:constant-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass sbcl-local-symbol-macro-description
    (trucler:local-symbol-macro-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass sbcl-global-symbol-macro-description
    (trucler:global-symbol-macro-description
     always-bound-mixin
     deprecated-mixin)
  ())

(defclass sbcl-global-variable-description
    (trucler:authentic-variable-description
     always-bound-mixin
     deprecated-mixin)
  ())

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-DESCRIPTION classes.
