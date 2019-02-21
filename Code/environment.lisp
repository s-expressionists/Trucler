(cl:in-package #:trucler)

(defgeneric global-environment (environment))

(defgeneric cached-function-description (environment))

(defgeneric cached-variable-description (environment))

(defgeneric cached-block-description (environment))

(defgeneric cached-tag-description (environment))

(defgeneric cached-optimize-description (environment))

(defclass environment ()
  ((%global-environment
    :initarg :global-environment
    :reader global-environment)
   (%function-description
    :initform '()
    :initarg :cached-function-description
    :reader cached-function-description)
   (%variable-description
    :initform '()
    :initarg :cached-variable-description
    :reader cached-variable-description)
   (%block-description
    :initform '()
    :initarg :cached-block-description
    :reader cached-block-description)
   (%tag-description
    :initform '()
    :initarg :cached-tag-description
    :reader cached-tag-description)
   (%optimize-description
    :initform '()
    :initarg :cached-optimize-description
    :reader cached-optimize-description)))

(defmethod cloning-information append ((object environment))
  '((:global-environment global-environment)
    (:cached-function-description cached-function-description)
    (:cached-variable-description cached-variable-description)
    (:cached-block-description cached-block-description)
    (:cached-tag-description cached-tag-description)
    (:cached-optimize-description cached-optimize-description)))
