(cl:in-package #:common-lisp-user)

(defpackage #:trucler
  (:use #:common-lisp)
  (:shadow #:identity
           #:type
           #:ignore
           #:inline
           #:compiler-macro
           #:dynamic-extent)
  (:export #:info
           #:variable-info
           #:lexical-variable-info
           #:special-variable-info
           #:constant-variable-info
           #:symbol-macro-info
           #:function-info
           #:local-function-info
           #:global-function-info
           #:generic-function-info
           #:local-macro-info
           #:global-macro-info
           #:special-operator-info
           #:block-info
           #:tag-info
           #:optimize-info))
