(cl:in-package #:trucler)

(define-condition no-information
    (program-error acclimation:condition)
  ((%name :initarg :name :reader name)
   (%origin :initarg :origin :reader origin)))

(define-condition no-variable-information (no-information)
  ())

(define-condition no-function-information (no-information)
  ())

(define-condition no-block-information (no-information)
  ())

(define-condition no-tag-information (no-information)
  ())

(define-condition no-class-information (no-information)
  ())
