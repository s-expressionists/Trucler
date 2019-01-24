(cl:in-package #:trucler)

;;;; This file contains definitions of generic functions for querying
;;;; the environment.
;;;;
;;;; The purpose of these functions is the same as those defined in
;;;; section 8.5 of the second edition of "Common Lisp, the Language"
;;;; by Guy Steele.  The big difference is that, while the functions
;;;; defined in the book return multiple values, the functions in this
;;;; file return standard objects.  Accessor functions can then be
;;;; used on those standard objects to determine the required
;;;; information.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; VARIABLE-INFO.

;;; Return an instance of the class VARIABLE-INFO describing the role
;;; of SYMBOL in ENVIRONMENT when SYMBOL was found in a variable
;;; position.
(defgeneric variable-info (environment symbol))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; FUNCTION-INFO.

;;; Return an instance of the class FUNCTION-INFO describing the role
;;; of FUNCTION-NAME in ENVIRONMENT when FUNCTION-NAME was found in a
;;; function position.  This function can also be used to obtain
;;; information about a function name that is not a symbol.
(defgeneric function-info (environment function-name))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; BLOCK-INFO.

;;; Return an instance of the class BLOCK-INFO describing the role of
;;; SYMBOL in ENVIRONMENT when SYMBOL was found in a position to name
;;; a block.
(defgeneric block-info (environment symbol))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; TAG-INFO.

;;; Return an instance of the class TAG-INFO describing the role of
;;; TAG in ENVIRONMENT when TAG was found in a position to name a
;;; TAGBODY tag, i.e. as an argument to GO.  TAG must be a symbol or
;;; an integer.
(defgeneric tag-info (environment tag))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; OPTIMIZE-INFO.

;;; Return an instance of the class OPTIMIZE-INFO describing the
;;; values of all OPTIMIZE qualities in ENVIRONMENT.
(defgeneric optimize-info (environment))
