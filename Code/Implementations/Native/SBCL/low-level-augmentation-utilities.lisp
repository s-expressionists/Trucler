(cl:in-package #:trucler-native-sbcl)

;;; See SB-CLTL2:AUGMENT-ENVIRONMENT for SBCL's internals.

(defun quasi-clone-environment (environment initarg initval)
  (let ((result (copy-structure environment)))
    (ecase initarg
      (:variables (setf (sb-c::lexenv-vars result) initval))
      (:functions (setf (sb-c::lexenv-funs result) initval))
      (:blocks (setf (sb-c::lexenv-blocks result) initval))
      (:tags (setf (sb-c::lexenv-tags result) initval))
      (:policy (setf (sb-c::lexenv-%policy result) initval)))
    result))

(defun make-lexical-variable-identity (name)
  (sb-c::make-lambda-var :%source-name name))

(defun make-local-function-identity (name)
  (sb-c::make-clambda :%source-name name
                      :lexenv *null-lexical-environment*
                      :allow-instrumenting nil))

(defun process-declarations (environment declarations lambda-vars functionals)
  (let ((sb-c::*lexenv* *null-lexical-environment*))
    (sb-c::process-decls declarations lambda-vars functionals
                         :lexenv environment :context nil)))

(defun augment-with-declaration-specifier (environment specifier)
  (process-declarations
   environment (list `(declare ,specifier)) '() '()))

(defun augment-with-optimize-quality (environment quality value)
  (process-declarations
   environment (list `(declare (optimize (,quality ,value)))) '() '()))

(defun augment-with-variable-annotation
    (environment variable-description annotation)
  (process-declarations
   environment
   (list `(declare (,annotation ,(trucler:name variable-description))))
   (etypecase variable-description
     (trucler:lexical-variable-description
      (list (trucler:identity variable-description)))
     (trucler:variable-description '()))
   '()))

(defun augment-with-function-annotation
    (environment function-description annotation)
  (let ((ftype-p (and (listp annotation)
                      (eq (first annotation) 'function)))
        (name (trucler:name function-description)))
    (process-declarations
     environment
     (list `(declare ,(if ftype-p
                          `(ftype ,annotation ,name)
                          `(,annotation (function ,name)))))
     '()
     (etypecase function-description
       (trucler:local-function-description
        (list (trucler:identity function-description)))
       (trucler:function-description '())))))
