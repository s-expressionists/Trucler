(cl:in-package #:trucler)

(defgeneric add-lexical-variable
    (client environment name &optional identity))

(defgeneric add-local-special-variable
    (client environment name))

(defgeneric add-local-symbol-macro
    (client environment name expansion))

(defgeneric add-local-function
    (client environment name &optional identity))

(defgeneric add-local-macro
    (client environment name expander))

(defgeneric add-block
    (client environment name &optional identity))

(defgeneric add-tag
    (client environment name &optional identity))

(defgeneric add-variable-type
    (client environment name type))

(defgeneric add-function-type
    (client environment name type))

(defgeneric add-variable-ignore
    (client environment name ignore))

(defgeneric add-function-ignore
    (client environment name ignore))

(defgeneric add-variable-dynamic-extent
    (client environment name))

(defgeneric add-function-dynamic-extent
    (client environment name))

(defgeneric add-inline
    (client environment name inline))

(defgeneric add-inline-data
    (client environment name inline-data))

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
