(cl:in-package #:trucler)

(defmethod augment-with-variable-description
    (client (environment environment) (variable-description variable-description))
  (quasi-clone environment
               :cached-variable-description
               (cons variable-description
                     (cached-variable-description environment))))

(defmethod augment-with-function-description
    (client (environment environment) (function-description function-description))
  (quasi-clone environment
               :cached-function-description
               (cons function-description
                     (cached-function-description environment))))

(defmethod augment-with-block-description
    (client (environment environment) (block-description block-description))
  (quasi-clone environment
               :cached-block-description
               (cons block-description
                     (cached-block-description environment))))

(defmethod augment-with-tag-description
    (client (environment environment) (tag-description tag-description))
  (quasi-clone environment
               :cached-tag-description
               (cons tag-description
                     (cached-tag-description environment))))
(defmethod augment-with-optimize-description
    (client (environment environment) (optimize-description optimize-description))
  (quasi-clone environment
               :cached-optimize-description
               (cons optimize-description
                     (cached-optimize-description environment))))
