(cl:in-package #:trucler-reference)

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
    :reader optimize-description)
   (%declarations-description
    :initform '()
    :initarg :declarations-description
    :reader declarations-description)
   ;; When this flag is set, the environment is restricted for use by
   ;; macrolet.  When the environment is restricted, a query that
   ;; returns a local function description or a lexical variable
   ;; description will signal an error.
   (%restricted-p
    :initform nil
    :initarg :restricted-p
    :reader restricted-p)))

(defmethod trucler:cloning-information append ((object environment))
  '((:global-environment global-environment)
    (:function-description function-description)
    (:variable-description variable-description)
    (:block-description block-description)
    (:tag-description tag-description)
    (:optimize-description optimize-description)))
