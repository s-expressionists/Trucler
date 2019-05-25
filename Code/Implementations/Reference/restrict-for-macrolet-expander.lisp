(cl:in-package #:trucler-reference)

(defmethod trucler:restrict-for-macrolet-expander
    ((client client) (environment environment))
  (trucler:quasi-clone environment :restricted-p t))
