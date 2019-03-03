(cl:in-package #:trucler-native)

(defgeneric global-environment (environment))

(defgeneric function-description (environment))

(defgeneric variable-description (environment))

(defgeneric block-description (environment))

(defgeneric tag-description (environment))

(defgeneric optimize-description (environment))

(defclass environment ()
  ((%global-environment
    :initarg :global-environment
    :reader global-environment)
   (%function-description
    :initform '()
    :initarg :function-description
    :reader function-description)
   (%variable-description
    :initform '()
    :initarg :variable-description
    :reader variable-description)
   (%block-description
    :initform '()
    :initarg :block-description
    :reader block-description)
   (%tag-description
    :initform '()
    :initarg :tag-description
    :reader tag-description)
   (%optimize-description
    :initform '()
    :initarg :optimize-description
    :reader optimize-description)))

(defmethod cloning-information append ((object environment))
  '((:global-environment global-environment)
    (:function-description function-description)
    (:variable-description variable-description)
    (:block-description block-description)
    (:tag-description tag-description)
    (:optimize-description optimize-description)))
