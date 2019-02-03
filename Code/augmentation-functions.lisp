(cl:in-package #:trucler)

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
    (client environment symbol &optional identity))

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
