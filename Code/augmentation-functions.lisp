(cl:in-package #:trucler)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Low-level autmentation functions.

(defgeneric augment-with-variable-information
    (client environment variable-information))

(defgeneric augment-with-function-information
    (client environment function-information))

(defgeneric augment-with-block-information
    (client environment block-information))

(defgeneric augment-with-tag-information
    (client environment tag-information))

(defgeneric augment-with-optimize-information
    (client environment optimize-information))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; High-level autmentation functions.

(defgeneric add-lexical-variable
    (client environment symbol &optional identity))

(defgeneric add-special-variable
    (client environment symbol))

(defgeneric add-local-symbol-macro
    (client environment symbol expansion))

(defgeneric add-local-function
    (client environment function-name &optional identity))

(defgeneric add-local-macro
    (client environment symbol expander))

(defgeneric add-block
    (client environment symbol &optional identity))

(defgeneric add-tag
    (client environment tag &optional identity))

(defgeneric add-variable-type
    (client environment symbol type))

(defgeneric add-function-type
    (client environment function-name type))

(defgeneric add-variable-ignore
    (client environment symbol ignore))

(defgeneric add-function-ignore
    (client environment function-name ignore))

(defgeneric add-variable-dynamic-extent
    (client environment symbol))

(defgeneric add-function-dynamic-extent
    (client environment function-name))

(defgeneric add-optimize
    (client environment quality value))

(defgeneric add-inline
    (client environment function-name inline))

(defgeneric add-inline-expansion
    (client environment function-name expansion))
