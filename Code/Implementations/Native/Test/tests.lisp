(in-package #:trucler-native-test)

;;; The test suite is invoked simply by loading it.  All tests are
;;; conducted implicitly during macro expansion.

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

(defvar *global* 42)

(defun test-special-variables ()
  (assert-global-special-variable *global*)
  (let ((*local* 77))
    (declare (special *local*))
    (assert-local-special-variable *local*)))

(defconstant +constant+ 42)

(defun test-constants ()
  (assert-constant-variable +constant+ :value 42))

(define-symbol-macro gsym 42)

(defun test-symbol-macros ()
  (symbol-macrolet ((lsym 12))
    (assert-global-symbol-macro-description gsym :expansion 42)
    (assert-local-symbol-macro-description lsym :expansion 12)))

(defun gfun ())

(defun test-functions ()
  (flet ((lfun ())
         ((setf lfun) (value) value))
    (assert-global-function-description gfun)
    (assert-local-function-description lfun)
    (assert-local-function-description (setf lfun))))

(defmacro gmacro ())

(defun test-macros ()
  (macrolet ((lmacro () (values)))
    (assert-global-macro-description gmacro)
    (assert-local-macro-description lmacro)))

(defun test-blocks ()
  (assert-block-description test-blocks)
  (block nil
    (block block
      (assert-block-description nil)
      (assert-block-description block))))

(defun test-tags ()
  (tagbody
   42 (assert-tag-description 42)
   43 (assert-tag-description 43)
   ?? (assert-tag-description ??)))

(defun test-optimize ()
  (assert-optimize-description)
  (locally
      (declare
       (optimize (speed 3) (compilation-speed 3) (debug 3) (space 3) (safety 3)))
    (assert-optimize-description :speed 3 :compilation-speed 3 :debug 3 :space 3 :safety 3)))
