(cl:in-package #:trucler-native-ccl)

(defmethod trucler:describe-variable
    ((client client) (env null) (name symbol))
  (trucler:describe-variable client *null-lexical-environment* name))

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
      ((eql :symbol-macro)
       (make-instance 'local-symbol-macro-description
         :name name
         :expansion more))
      ((eql :special)
       (make-instance 'local-special-variable-description
         :name name))
      (null
       (trucler:describe-variable client (ccl::definition-environment env) name)))))

(defmethod trucler:describe-variable
    ((client client) (env ccl::definition-environment) (name symbol))
  (let ((symbol-macro-entry (assoc name (ccl::defenv.symbol-macros env)))
        (constant-entry (assoc name (ccl::defenv.constants env)))
        (global-special-entry (assoc name (ccl::defenv.specials env))))
    (cond ((consp symbol-macro-entry)
           (make-instance 'global-symbol-macro-description
             :name name
             :expansion (cdr symbol-macro-entry)))
          ((consp constant-entry)
           (make-instance 'constant-variable-description
             :name name
             :value (cdr constant-entry)))
          ((consp global-special-entry)
           (make-instance 'global-special-variable-description
             :name name))
          (t
           (describe-global-variable name)))))

(defun describe-global-variable (name)
  (break)
  (let ((bits (ccl::%symbol-bits name)))
    (cond ((logbitp ccl::$sym_vbit_const bits)
           (make-instance 'constant-variable-description
             :name name
             :value (ccl::%sym-global-value name)))
          ((logbitp ccl::$sym_vbit_special bits)
           (make-instance 'global-special-variable-description
             :name name))
          (t
           (multiple-value-bind (expansion global-symbol-macro-p)
               (gethash name ccl::*symbol-macros*)
             (if global-symbol-macro-p
                 (make-instance 'global-symbol-macro-description
                   :name name
                   :expansion expansion)))))))
