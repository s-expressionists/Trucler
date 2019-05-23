(cl:in-package #:trucler)

(define-condition no-description (program-error acclimation:condition)
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

(define-condition invalid-description (program-error acclimation:condition)
  ((%description :initarg :description :reader description)))

(define-condition invalid-description-for-merging-type-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-ignore-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-dynamic-extent-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-inline-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-inline-data
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-speed-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-compilation-speed-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-debug-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-safety-information
    (invalid-description)
  ())

(define-condition invalid-description-for-merging-space-information
    (invalid-description)
  ())
