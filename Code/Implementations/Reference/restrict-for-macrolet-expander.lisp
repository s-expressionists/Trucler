(cl:in-package #:trucler-reference)

(defclass error-description (trucler:name-mixin)
  ())

(defgeneric restrict-description (description))

(defun make-error-description (description)
  (make-instance 'error-description :name (trucler:name description)))

(defmethod restrict-description (description)
  description)

(defmethod restrict-description ((description trucler:block-description))
  (make-error-description description))

(defmethod restrict-description ((description trucler:tag-description))
  (make-error-description description))

(defmethod restrict-description ((description trucler:block-description))
  (make-error-description description))

(defmethod restrict-description ((description trucler:lexical-variable-description))
  (make-error-description description))

(defmethod restrict-description ((description trucler:local-function-description))
  (make-error-description description))

(defun restrict-descriptions (descriptions)
  (mapcar #'restrict-description descriptions))

(defmethod trucler:restrict-for-macrolet-expander (client (environment environment))
  (apply #'make-instance
         (class-of environment)
         :function-description
         (restrict-descriptions (function-description environment))
         :variable-description
         (restrict-descriptions (variable-description environment))
         :block-description
         (restrict-descriptions (block-description environment))
         :tag-description
         (restrict-descriptions (tag-description environment))
         (loop for (initarg reader) in (trucler:cloning-information environment)
               collect initarg
               collect (funcall reader environment))))
