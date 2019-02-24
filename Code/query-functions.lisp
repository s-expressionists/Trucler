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

(defgeneric describe-class (client environment name))

(defgeneric describe-block (client environment namel))

(defgeneric describe-tag (client environment tag))

(defgeneric describe-optimize (client environment))
