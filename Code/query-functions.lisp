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

(defgeneric variable-info (client environment variable-name))

(defgeneric function-info (client environment function-name))

(defgeneric class-info (client environment class-name))

(defgeneric block-info (client environment block-namel))

(defgeneric tag-info (client environment tag-name))

(defgeneric optimize-info (client environment))
