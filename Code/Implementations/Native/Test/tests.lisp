(in-package #:trucler-native-test)

;;; The test suite is invoked simply by loading it.  All tests are
;;; conducted implicitly during macro expansion.

(defconstant +constant+ 42)

(defvar *global* 42)

(defun test-lexical-variables ()
  (let ((a 5)
        (b 9)
        (c 12)
        (d 16)
        (e 16))
    (declare (fixnum b))
    (declare (dynamic-extent c))
    (declare (ignore d))
    (declare (ignorable e))
    (assert-lexical-variable a)
    (assert-lexical-variable b :type fixnum)
    (assert-lexical-variable c :dynamic-extent t)
    (assert-lexical-variable d :ignore cl:ignore)
    (assert-lexical-variable e :ignore cl:ignorable)))

(defun test-special-variables ()
  (assert-global-special-variable *global*)
  (let ((*local* 77))
    (declare (special *local*))
    (assert-local-special-variable *local*)))
