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

(defgeneric add-inline
    (client environment function-name inline))

(defgeneric add-inline-data
    (client environment function-name inline-data))

(defgeneric add-speed
    (client environment value))

(defgeneric add-compilation-speed
    (client environment value))

(defgeneric add-debug
    (client environment value))

(defgeneric add-safety
    (client environment value))

(defgeneric add-space
    (client environment value))

;;; This function is kind of an augmentation function.  It is called
;;; in order to return a new environment that can be used to compile
;;; the macro expander of MACROLET.  The expander code of MACROLET is
;;; not allowed to access local variables or local functions, because
;;; the expander code is executed at compile time, whereas the local
;;; variables and functions do not exist until run time.

(defgeneric restrict-for-macrolet-expander (client environment))
