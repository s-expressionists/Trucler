(cl:in-package #:trucler)

(defmethod augment-with-variable-information
    (client (environment environment) (variable-information variable-information))
  (quasi-clone environment
               :cached-variable-information
               (cons variable-information
                     (cached-variable-information environment))))

(defmethod augment-with-function-information
    (client (environment environment) (function-information function-information))
  (quasi-clone environment
               :cached-function-information
               (cons function-information
                     (cached-function-information environment))))

(defmethod augment-with-block-information
    (client (environment environment) (block-information block-information))
  (quasi-clone environment
               :cached-block-information
               (cons block-information
                     (cached-block-information environment))))

(defmethod augment-with-tag-information
    (client (environment environment) (tag-information tag-information))
  (quasi-clone environment
               :cached-tag-information
               (cons tag-information
                     (cached-tag-information environment))))
(defmethod augment-with-optimize-information
    (client (environment environment) (optimize-information optimize-information))
  (quasi-clone environment
               :cached-optimize-information
               (cons optimize-information
                     (cached-optimize-information environment))))
