(cl:in-package #:trucler)

(define-condition no-description
    (program-error acclimation:condition)
  ((%name :initarg :name :reader name)
   (%origin :initarg :origin :reader origin)))

(define-condition no-variable-description (no-description)
  ())

(define-condition no-function-description (no-description)
  ())

(define-condition no-block-description (no-description)
  ())

(define-condition no-tag-description (no-description)
  ())

(define-condition no-class-description (no-description)
  ())
