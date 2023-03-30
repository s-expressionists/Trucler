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
           #:safety
           #:macro-function
           #:compiler-macro-function)
  (:export #:description
           ;; Mixin classes.
           #:name-mixin
           #:identity-mixin
           #:type-mixin
           #:ignore-mixin
           #:dynamic-extent-mixin
           #:value-mixin
           #:compiler-macro-mixin
           #:expander-mixin
           #:expansion-mixin
           #:inline-mixin
           #:inline-data-mixin
           #:speed-mixin
           #:compilation-speed-mixin
           #:debug-mixin
           #:space-mixin
           #:safety-mixin
	   #:special-operator-description
           ;; Macro for defining mixin classes.
           #:define-mixin-class
           ;; Generic function for variable information.
           #:describe-variable
           ;; Classes for variable description.
           #:variable-description
           #:authentic-variable-description
           #:lexical-variable-description
           #:special-variable-description
           #:local-special-variable-description
           #:global-special-variable-description
           #:constant-variable-description
           #:symbol-macro-description
	   #:local-symbol-macro-description
	   #:global-symbol-macro-description
           ;; Query factories.
           #:lexical-variable-description-class
           #:special-variable-description-class
           #:local-symbol-macro-description-class
           #:local-function-description-class
           #:local-macro-description-class
           #:block-description-class
           #:tag-description-class
           ;; Generic function for function information.
           #:describe-function
           ;; Classes for function description.
           #:function-description
           #:authentic-function-description
           #:local-function-description
           #:global-function-description
           #:generic-function-description
	   #:special-operator-description
           #:macro-description
           #:local-macro-description
           #:global-macro-description
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
           ;; Generic function for declarations information.
           #:describe-declarations
           ;; Class for declarations description.
           #:declarations-description
           ;; Function for finding the global environment.
           #:global-environment
           #:global-environment-p
           ;; Description accessors.
           #:origin
           #:name
           #:identity
           #:type
           #:ignore
           #:inline
           #:inline-data
           #:compiler-macro
           #:dynamic-extent
           #:value
           #:expansion
           #:expander
           #:speed
           #:compilation-speed
           #:debug
           #:space
           #:safety
           #:declarations
           ;; Augmentation functions.
	   #:augment-with-variable-description
	   #:augment-with-function-description
	   #:augment-with-block-description
	   #:augment-with-tag-description
	   #:augment-with-optimize-description
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
           #:add-inline-data
           #:restrict-for-macrolet-expander
           ;; Environment building functions.
           #:make-environment-builder
           #:finalize-environment-builder
	   ;; Merge functions
	   #:merge-type
	   #:merge-ignore
	   #:merge-dynamic-extent
	   #:merge-inline
           #:merge-inline-data
	   #:merge-speed
	   #:merge-compilation-speed
	   #:merge-debug
	   #:merge-safety
	   #:merge-space
	   ;; Cloning
	   #:quasi-clone
           #:cloning-information
           ;; Macro functions.
           #:macro-function
           #:compiler-macro-function
           #:symbol-macro-expansion
           ;; Condition types.
           #:invalid-description-for-merging-type-information
           #:invalid-description-for-merging-ignore-information
           #:invalid-description-for-merging-dynamic-extetn-information
           #:invalid-description-for-merging-inline-information
           #:undefined-function-referred-to-by-inline-declaration
           #:try-again #:ignore-declaration
           #:invalid-description-for-merging-inline-data
           #:invalid-description-for-merging-speed-information
           #:invalid-description-for-merging-compilation-speed-information
           #:invalid-description-for-merging-debug-information
           #:invalid-description-for-merging-safety-information
           #:invalid-description-for-merging-space-information))
