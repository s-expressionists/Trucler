(cl:in-package #:trucler)

(defgeneric global-environment (environment))

(defgeneric cached-function-information (environment))

(defgeneric cached-variable-information (environment))

(defgeneric cached-block-information (environment))

(defgeneric cached-tag-information (environment))

(defgeneric cached-optimize-information (environment))

(defclass environment ()
  ((%global-environment
    :initarg :global-environment
    :reader global-environment)
   (%function-information
    :initform '()
    :initarg :cached-function-information
    :reader cached-function-information)
   (%variable-information
    :initform '()
    :initarg :cached-variable-information
    :reader cached-variable-information)
   (%block-information
    :initform '()
    :initarg :cached-block-information
    :reader cached-block-information)
   (%tag-information
    :initform '()
    :initarg :cached-tag-information
    :reader cached-tag-information)
   (%optimize-information
    :initform '()
    :initarg :cached-optimize-information
    :reader cached-optimize-information)))

(defmethod clone-information append ((object environment))
  '((:global-environment global-environment)
    (:cached-function-information cached-function-information)
    (:cached-variable-information cached-variable-information)
    (:cached-block-information cached-block-information)
    (:cached-tag-information cached-tag-information)
    (:cached-optimize-information cached-optimize-information)))
