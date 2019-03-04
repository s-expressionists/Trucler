(cl:in-package #:trucler-native)

(defmethod trucler:augment-with-variable-description
    ((client client) (environment environment) (variable-description trucler:variable-description))
  (trucler:quasi-clone environment
		       :variable-description
		       (cons variable-description
			     (variable-description environment))))

(defmethod trucler:augment-with-function-description
    ((client client) (environment environment) (function-description trucler:function-description))
  (trucler:quasi-clone environment
		       :function-description
		       (cons function-description
			     (function-description environment))))

(defmethod trucler:augment-with-block-description
    ((client client) (environment environment) (block-description trucler:block-description))
  (trucler:quasi-clone environment
		       :block-description
		       (cons block-description
			     (block-description environment))))

(defmethod trucler:augment-with-tag-description
    ((client client) (environment environment) (tag-description trucler:tag-description))
  (trucler:quasi-clone environment
		       :tag-description
		       (cons tag-description
			     (tag-description environment))))

(defmethod trucler:augment-with-optimize-description
    ((client client) (environment environment) (optimize-description trucler:optimize-description))
  (trucler:quasi-clone environment
		       :optimize-description
		       (cons optimize-description
			     (optimize-description environment))))
