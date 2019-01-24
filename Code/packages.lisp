(cl:in-package #:common-lisp-user)

(defpackage #:trucler
  (:use #:common-lisp)
  (:shadow #:identity
           #:type
           #:ignore
           #:dynamic-extent)
  (:export #:info
           #:variable-info
           #:lexical-variable-info
           #:special-variable-info
           #:constant-variable-info
           #:symbol-macro-info))
