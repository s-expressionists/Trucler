(cl:in-package #:trucler)

(defmethod add-lexical-variable
    (client (environment environment) symbol &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-variable-infos
               (cons (make-instance 'lexical-variable-info
                       :name symbol
                       :identity identity)
                     (cached-variable-infos environment))))

(defmethod add-special-variable
    (client (environment environment) symbol)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-variable-infos
               (cons (make-instance 'special-variable-info
                       :name symbol)
                     (cached-variable-infos environment))))

(defmethod add-local-symbol-macro
    (client (environment environment) symbol expansion)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-variable-infos
               (cons (make-instance 'local-symbol-macro-info
                       :name symbol
                       :expansion expansion)
                     (cached-variable-infos environment))))

(defmethod add-local-function
    (client (environment environment) symbol &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-function-infos
               (cons (make-instance 'local-function-info
                       :name symbol
                       :identity identity)
                     (cached-function-infos environment))))

(defmethod add-local-macro
    (client (environment environment) symbol expander)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-macro-infos
               (cons (make-instance 'local-macro-info
                       :name symbol
                       :expander expander)
                     (cached-function-infos environment))))

(defmethod add-block
    (client (environment environment) symbol &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-block-infos
               (cons (make-instance 'block-info
                       :name symbol
                       :identity identity)
                     (cached-block-infos environment))))

(defmethod add-tag
    (client (environment environment) tag &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-tag-infos
               (cons (make-instance 'tag-info
                       :name tag
                       :identity identity)
                     (cached-tag-infos environment))))
