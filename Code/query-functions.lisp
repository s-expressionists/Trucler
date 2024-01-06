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

(defgeneric describe-variable (client environment name))

(defgeneric describe-function (client environment name))

(defgeneric describe-block (client environment name))

(defgeneric describe-tag (client environment name))

(defgeneric describe-optimize (client environment))

(defgeneric describe-declarations (client environment))

;;; Given an environment, this function returns the global
;;; environment.  If the environment given as an argument is the
;;; global environment, then this function returns that argument.
(defgeneric global-environment (client environment))

;;; Returns whether a given environment is a global environment, i.e.,
;;; a null lexical environment.
(defgeneric global-environment-p (client environment))
