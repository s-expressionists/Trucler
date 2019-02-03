(cl:in-package #:trucler)

(defgeneric global-environment (environment))

(defgeneric cached-function-infos (environment))

(defgeneric cached-variable-infos (environment))

(defgeneric cached-block-infos (environment))

(defgeneric cached-tag-infos (environment))

(defgeneric cached-optimize-info (environment))

(defclass environment ()
  ((%global-environment
    :initarg :global-environment
    :reader global-environment)
   (%function-infos
    :initform '()
    :initarg :cached-function-infos
    :reader cached-function-infos)
   (%variable-infos
    :initform '()
    :initarg :cached-variable-infos
    :reader cached-variable-infos)
   (%block-infos
    :initform '()
    :initarg :cached-block-infos
    :reader cached-block-infos)
   (%tag-infos
    :initform '()
    :initarg :cached-tag-infos
    :reader cached-tag-infos)
   (%optimization-info
    :initform '()
    :initarg :cached-optimization-info
    :reader cached-optimization-info)))

(defmethod clone-info append ((object environment))
  '((:global-environment global-environment)
    (:cached-function-infos cached-function-infos)
    (:cached-variable-infos cached-variable-infos)
    (:cached-block-infos cached-block-infos)
    (:cached-tag-infos cached-tag-infos)
    (:cached-optimization-info cached-optimization-info)))
