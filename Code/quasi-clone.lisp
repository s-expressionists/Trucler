(cl:in-package #:trucler)

(defun quasi-clone (instance initarg initval)
  (apply #'make-instance
         (class-of instance)
         initarg initval
         (loop for (initarg reader) in (clone-info instance)
               collect initarg
               collect (funcall reader instance))))
