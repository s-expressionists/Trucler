(cl:in-package #:trucler-reference)

(defmethod trucler:macro-function (name (environment environment))
  (let* ((descriptions (function-description environment))
         (description (find name descriptions :test #'eq :key #'trucler:name)))
    (cond ((null description)
           (let ((global-environment (global-environment environment)))
             (trucler:macro-function name global-environment)))
          ((typep description 'trucler:expander-mixin)
           (trucler:expander description))
          (t nil))))

(defmethod trucler:compiler-macro-function (name (environment environment))
  (let* ((descriptions (function-description environment))
         (description (find name descriptions :test #'equal :key #'trucler:name)))
    (cond ((null description)
           (let ((global-environment (global-environment environment)))
             (trucler:compiler-macro-function name global-environment)))
          ((typep description 'trucler:compiler-macro-mixin)
           (trucler:compiler-macro description))
          (t nil))))

(defmethod trucler:symbol-macro-expansion (name (environment environment))
  (let* ((descriptions (variable-description environment))
         (description (find name descriptions :test #'eq :key #'trucler:name)))
    (cond ((null description)
           (let ((global-environment (global-environment environment)))
             (trucler:symbol-macro-expansion name global-environment)))
          ((typep description 'trucler:expansion-mixin)
           (trucler:expansion description))
          (t nil))))
