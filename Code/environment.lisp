(cl:in-package #:trucler)

(defgeneric global-environment (environment))

(defgeneric function-infos (environment))

(defgeneric variable-infos (environment))

(defgeneric block-infos (environment))

(defgeneric tag-infos (environment))

(defgeneric optimize-infos (environment))

(defclass environment ()
  ((%global-environment
    :initarg :global-environment
    :reader global-environment)
   (%function-infos
    :initform '()
    :initarg :function-infos
    :reader function-infos)
   (%variable-infos
    :initform '()
    :initarg :variable-infos
    :reader variable-infos)
   (%block-infos
    :initform '()
    :initarg :block-infos
    :reader block-infos)
   (%tag-infos
    :initform '()
    :initarg :tag-infos
    :reader tag-infos)
   (%optimization-infos
    :initform '()
    :initarg :optimization-infos
    :reader optimization-infos)))
