(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-function
    ((client client) (env null) name)
  (trucler:describe-function client *null-lexical-environment* name))

(defmethod trucler:describe-function
    ((client client) (env ccl::lexical-environment) name)
  (multiple-value-bind (info more)
      (ccl::nx-lexical-finfo (ccl:setf-function-spec-name name) env)
    (if (not info)
        (trucler:describe-function client (ccl::definition-environment env) name)
        (destructuring-bind (type afunc) info
          (ecase type
            (function
             (make-instance 'local-function-description
               :name name
               :identity afunc)))))))

(defmethod trucler:describe-function
    ((client client) (env ccl::definition-environment) name)
  (multiple-value-bind (entry present-p)
      (gethash name (ccl::defenv.defined env))
    (if (not present-p)
        (describe-global-function name env)
        (let ((def-info (cdr entry)))
          (cond ((ccl::def-info.function-p def-info)
                 (make-instance 'global-function-description
                   :name name
                   :type (ccl::def-info.function-type def-info)
                   :class-name 'function))
                ((ccl::def-info.macro-p def-info)
                 (make-instance 'global-macro-description
                   :name name
                   :expander (cdr def-info))))))))

(defun describe-global-function (name env)
  (if (not (fboundp name))
      nil
      (if (special-operator-p name)
          (make-instance 'special-operator-description
            :name name)
          (let ((expander (macro-function name env)))
            (if (functionp expander)
                (make-instance 'global-macro-description
                  :name name
                  :expander expander)
                (make-instance 'global-function-description
                  :name name
                  :type (ccl::find-ftype-decl name env)
                  :inline (cond ((ccl::proclaimed-inline-p name) 'cl:inline)
                                ((ccl::proclaimed-notinline-p name) 'cl:notinline)
                                (t nil))))))))
