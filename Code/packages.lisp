(cl:in-package #:common-lisp-user)

(defpackage #:trucler
  (:use #:common-lisp)
  (:shadow #:identity
           #:type
           #:ignore
           #:inline
           #:compiler-macro
           #:dynamic-extent
           #:speed
           #:compilation-speed
           #:debug
           #:space
           #:safety)
  (:export #:info
           ;; Generic function and base class for variable information.
           #:variable-info
           ;; Classes for variable information.
           #:lexical-variable-info
           #:special-variable-info
           #:constant-variable-info
           #:symbol-macro-info
           ;; Generic function and base class for function information.
           #:function-info
           ;; Classes for function information.
           #:local-function-info
           #:global-function-info
           #:generic-function-info
           #:local-macro-info
           #:global-macro-info
           #:special-operator-info
           ;; Generic function and class for block information.
           #:block-info
           ;; Generic function and class for tag information.
           #:tag-info
           ;; Generic function and class for optimize information.
           #:optimize-info
           ;; INFO accessors
           #:name
           #:identity
           #:type
           #:ignore
           #:inline
           #:compiler-macro
           #:dynamic-extent
           #:global-p
           #:value
           #:expansion
           #:expander
           #:class-name
           #:method-class-name
           ;; Augmentation functions.
           #:add-lexical-variable
           #:add-special-variable
           #:add-local-symbol-macro
           #:add-local-function
           #:add-local-macro
           #:add-block
           #:add-tag
           #:add-variable-type
           #:add-function-type
           #:add-variable-ignore
           #:add-function-ignore
           #:add-variable-dynamic-extent
           #:add-function-dynamic-extent
           #:add-optimize
           #:add-inline
           #:add-inline-expansion
           ;; Condition types.
           #:no-info
           #:no-variable-info
           #:no-function-info
           #:no-block-info
           #:no-tag-info))
