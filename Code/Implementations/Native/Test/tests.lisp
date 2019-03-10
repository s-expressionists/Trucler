(in-package #:trucler-native-test)

;;; The test suite is invoked simply by loading it.  All tests are
;;; conducted implicitly during macro expansion.

(defconstant +constant+ 42)

(defvar *global* 42)

(defun test-variable-descriptions ()
  (let ((a 5)
        (b 9)
        (c 12)
        (*local* 77))
    (declare (fixnum b))
    (declare (dynamic-extent c))
    (declare (special *local*))
    (assert-lexical-variable a)
    (assert-lexical-variable b :type fixnum)
    (assert-lexical-variable c :dynamic-extent t)
    (assert-special-variable *global*)
    (assert-special-variable *local* :global-p nil)))
