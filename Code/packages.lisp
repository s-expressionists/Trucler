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
           ;; Mixin classes.
           #:name-mixin
           #:identity-mixin
           #:type-mixin
           #:ignore-mixin
           #:dynamic-extent-mixin
           #:compiler-macro-mxin
           #:expander-mixin
           #:expasion-mixin
           #:class-name-mixin
           #:inline-mixin
           #:method-class-name-mixin
           #:speed-mixin
           #:compilation-speed-mixin
           #:debug-mixin
           #:space-mixin
           #:safety-mixin
           ;; Macro for definining mixin classes.
           #:define-mixin-class
           ;; Generic function and base class for variable information.
           #:variable-information
           ;; Classes for variable information.
           #:authentic-variable-information
           #:lexical-variable-information
           #:special-variable-information
           #:constant-variable-information
           #:symbol-macro-information
           ;; Generic function and base class for function information.
           #:function-information
           ;; Classes for function information.
           #:authentic-function-information
           #:local-function-information
           #:global-function-information
           #:generic-function-information
           #:macro-information
           #:local-macro-information
           #:global-macro-information
           #:special-operator-information
           ;; Generic function and class for block information.
           #:block-information
           ;; Generic function and class for tag information.
           #:tag-information
           ;; Generic function and class for optimize information.
           #:optimize-information
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
           #:no-information
           #:no-variable-information
           #:no-function-information
           #:no-block-information
           #:no-tag-information))
