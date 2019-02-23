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
  (:export #:description
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
           ;; Generic function for variable information.
           #:describe-variable
           ;; Classes for variable description.
           #:variable-description
           #:authentic-variable-description
           #:lexical-variable-description
           #:special-variable-description
           #:constant-variable-description
           #:symbol-macro-description
           ;; Generic function for function information.
           #:describe-function
           ;; Classes for function description.
           #:function-description
           #:authentic-function-description
           #:local-function-description
           #:global-function-description
           #:generic-function-description
           #:macro-description
           #:local-macro-description
           #:global-macro-description
           #:special-operator-description
           ;; Generic function for block information.
           #:describe-block
           ;; Class for block description.
           #:block-description
           ;; Generic function for tag information.
           #:describe-tag
           ;; Class for tag description.
           #:tag-description
           ;; Generic function for optimize information.
           #:describe-optimize
           ;; Class for optimize description.
           #:optimize-description
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
           #:add-speed
           #:add-compilation-speed
           #:add-debug
           #:add-safety
           #:add-space
           #:add-inline
           ;; Condition types.
           #:no-description
           #:no-variable-description
           #:no-function-description
           #:no-block-description
           #:no-tag-description
           #:invalid-description-for-merging-type-information
           #:invalid-description-for-merging-ignore-information
           #:invalid-description-for-merging-dynamic-extetn-information
           #:invalid-description-for-merging-inline-information
           #:invalid-description-for-merging-speed-information
           #:invalid-description-for-merging-compilation-speed-information
           #:invalid-description-for-merging-debug-information
           #:invalid-description-for-merging-safety-information
           #:invalid-description-for-merging-space-information))
