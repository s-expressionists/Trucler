(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-variable
    ((client client) (env ccl::lexical-environment) (name symbol))
  (multiple-value-bind (info more)
      (let ((ccl::*nx-lexical-environment* env))
        (ccl::nx-lex-info name))
    (etypecase info
      (ccl::var
       (let* ((bits (ccl::var-bits info))
              (ignore (logtest bits (ash 1 ccl::$vbitignore)))
              (ignorable (logtest bits (ash 1 ccl::$vbitignorable)))
              (dynamic-extent (logtest bits (ash 1 ccl::$vbitdynamicextent))))
         (make-instance 'lexical-variable-description
           :name (ccl::var-name info)
           :type (ccl::var-declared-type info)
           :identity info
           :dynamic-extent dynamic-extent
           :ignore (cond (ignore 'cl:ignore)
                         (ignorable 'cl:ignorable)
                         (t nil)))))
      (null
       (trucler:describe-variable client (ccl::definition-environment env) name)))))

(defmethod trucler:describe-variable
    ((client client) (env ccl::definition-environment) (name symbol))
  )
