(cl:in-package #:trucler-native-test)

;;; The test suite is invoked simply by loading it.  All tests are
;;; conducted implicitly during macro expansion.

;;; Can add tests for implementation-specific annotations, e.g., SBCL's
;;; always-bound and deprecated annotations, when a second supported
;;; implementation has some.

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *debug-environment*))

(defmacro skip-failing-tests (&body body)
  (declare (ignore body))
  nil)

(defun test-lexical-variables ()
  (let ((a 1)
        (b 2)
        (c 3)
        (d 3)
        (e 4))
    (declare (fixnum b))
    (declare (ignore c))
    (declare (ignorable d))
    (declare (dynamic-extent e))
    (assert-lexical-variable-description a)
    (assert-lexical-variable-description b :type fixnum)
    (assert-lexical-variable-description c :ignore cl:ignore)
    (assert-lexical-variable-description d :ignore cl:ignorable)
    (assert-lexical-variable-description e :dynamic-extent t))
  #+sbcl (assert-add-lexical-variable a)
  #+sbcl (assert-add-lexical-variable b :type fixnum)
  #+sbcl (assert-add-lexical-variable c :ignore cl:ignore)
  #+sbcl (assert-add-lexical-variable d :ignore cl:ignorable)
  #+sbcl (assert-add-lexical-variable e :dynamic-extent t))

(defvar *global-a* 1)
(defvar *global-b* 2)
(declaim (fixnum *global-b*))

(defun test-special-variables ()
  (assert-global-special-variable-description *global-a*)
  #+sbcl (assert-global-special-variable-description *global-b* :type fixnum)
  (let ((*a* 1)
        (*b* 2))
    (declare (special *a*))
    (declare (special *b*) (fixnum *b*))
    (assert-local-special-variable-description *a*)
    #+sbcl (assert-local-special-variable-description *b* :type fixnum))
  #+sbcl (assert-add-local-special-variable *a*)
  (skip-failing-tests
    #+sbcl (assert-add-local-special-variable *b* :type fixnum)))

(defconstant +constant+ 1)

(defun test-constants ()
  (assert-constant-variable-description +constant+ :value 1))

(define-symbol-macro global-symbol-a 1)
(define-symbol-macro global-symbol-b 2)
(declaim (fixnum global-symbol-b))

(defun test-symbol-macros ()
  (assert-global-symbol-macro-description global-symbol-a :expansion 1)
  #+sbcl (assert-global-symbol-macro-description global-symbol-b :type fixnum
                                                                 :expansion 2)
  (symbol-macrolet ((a 1)
                    (b 2))
    (declare (fixnum b))
    (assert-local-symbol-macro-description a :expansion 1)
    #+sbcl (assert-local-symbol-macro-description b :type fixnum
                                                    :expansion #+sbcl (the fixnum 2)
                                                               #-sbcl 2))
  #+sbcl (assert-add-local-symbol-macro a 1)
  #+sbcl (assert-add-local-symbol-macro b 2 :type fixnum))

(defun global-function-a ())
(defun (setf global-function-a) (value) value)

(defun global-function-b () nil)
(declaim (ftype (function () (values null &optional)) global-function-b))

(defun global-function-c ())
(declaim (inline global-function-c))

(defun global-function-d ())
(define-compiler-macro global-function-d ())

(defun test-functions ()
  (assert-global-function-description global-function-a)
  #+sbcl (assert-global-function-description (setf global-function-a))
  #+sbcl (assert-global-function-description
          global-function-b :type (function () (values null &optional)))
  #+sbcl (assert-global-function-description global-function-c :inline cl:inline)
  #+sbcl (assert-global-function-description global-function-d
                                             :require-compiler-macro t)
  (flet ((a ())
         ((setf a) (value) value)
         (b () nil)
         (c ())
         (d ())
         (e ()))
    (declare (ftype (function () (values null &optional)) b)
             (ignore #'c)
             (ignorable #'d)
             (dynamic-extent #'e))
    (assert-local-function-description a)
    #+sbcl (assert-local-function-description (setf a))
    #+sbcl (assert-local-function-description
            b :type (function () (values null &optional)))
    #+sbcl (assert-local-function-description c :ignore cl:ignore)
    #+sbcl (assert-local-function-description d :ignore cl:ignorable)
    #+sbcl (assert-local-function-description e :dynamic-extent t))
  #+sbcl (assert-add-local-function a)
  #+sbcl (assert-add-local-function (setf a))
  #+sbcl (assert-add-local-function b :type (function () (values null &optional)))
  #+sbcl (assert-add-local-function c :ignore cl:ignore)
  #+sbcl (assert-add-local-function d :ignore cl:ignorable)
  #+sbcl (assert-add-local-function e :dynamic-extent t))

(defmacro global-macro-a ())
(defmacro global-macro-b ())
(define-compiler-macro global-macro-b ())

(defun test-macros ()
  (assert-global-macro-description global-macro-a)
  #+sbcl (assert-global-macro-description global-macro-b :require-compiler-macro t)
  (macrolet ((a () (values)))
    (assert-local-macro-description a))
  #+sbcl (assert-add-local-macro a))

(defun test-operators ()
  (assert-special-operator-description if)
  (assert-special-operator-description let))

(defun test-blocks ()
  (assert-block-description test-blocks)
  (block nil
    (block block
      (assert-block-description nil)
      (assert-block-description block)))
  #+sbcl (assert-add-block nil)
  #+sbcl (assert-add-block block))

(defun test-tags ()
  (tagbody
   1 (assert-tag-description 1)
   2 (assert-tag-description 2)
   ? (assert-tag-description ?))
  #+sbcl (assert-add-tag 1)
  #+sbcl (assert-add-tag 2)
  #+sbcl (assert-add-tag ?))

(defun test-optimize ()
  (assert-optimize-description)
  (locally (declare (optimize (speed 3)
                              (compilation-speed 3)
                              (debug 3)
                              (space 3)
                              (safety 3)))
    (assert-optimize-description
     :speed 3 :compilation-speed 3 :debug 3 :space 3 :safety 3))
  #+sbcl (assert-add-optimize
          :speed 3 :compilation-speed 3 :debug 3 :space 3 :safety 3))
