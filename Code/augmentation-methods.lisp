(cl:in-package #:trucler)

(defmethod add-lexical-variable
    (client (environment environment) symbol &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-variable-information
               (cons (make-instance 'lexical-variable-information
                       :name symbol
                       :identity identity)
                     (cached-variable-information environment))))

(defmethod add-special-variable
    (client (environment environment) symbol)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-variable-information
               (cons (make-instance 'special-variable-information
                       :name symbol)
                     (cached-variable-information environment))))

(defmethod add-local-symbol-macro
    (client (environment environment) symbol expansion)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-variable-information
               (cons (make-instance 'local-symbol-macro-information
                       :name symbol
                       :expansion expansion)
                     (cached-variable-information environment))))

(defmethod add-local-function
    (client (environment environment) symbol &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-function-information
               (cons (make-instance 'local-function-information
                       :name symbol
                       :identity identity)
                     (cached-function-information environment))))

(defmethod add-local-macro
    (client (environment environment) symbol expander)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-macro-information
               (cons (make-instance 'local-macro-information
                       :name symbol
                       :expander expander)
                     (cached-function-information environment))))

(defmethod add-block
    (client (environment environment) symbol &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-block-information
               (cons (make-instance 'block-information
                       :name symbol
                       :identity identity)
                     (cached-block-information environment))))

(defmethod add-tag
    (client (environment environment) tag &optional identity)
  (declare (cl:ignore client))
  (quasi-clone environment
               :cached-tag-information
               (cons (make-instance 'tag-information
                       :name tag
                       :identity identity)
                     (cached-tag-information environment))))

(defmethod add-variable-type
    (client (environment environment) symbol type)
  (let ((info (variable-information client environment symbol)))
    (quasi-clone environment
                 :cached-variable-information
                 (cons (merge-variable-type info type)
                       (cached-variable-information environment)))))

(defmethod add-variable-ignore
    (client (environment environment) symbol ignore)
  (let ((info (variable-information client environment symbol)))
    (quasi-clone environment
                 :cached-variable-information
                 (cons (merge-variable-ignore info ignore)
                       (cached-variable-information environment)))))

(defmethod add-variable-dynamic-extent
    (client (environment environment) variable-name)
  (let ((info (variable-information client environment variable-name)))
    (quasi-clone environment
                 :cached-variable-information
                 (cons (merge-variable-dynamic-extent info)
                       (cached-variable-information environment)))))

(defmethod add-inline
    (client (environment environment) function-name inline)
  (let ((info (function-information client environment function-name)))
    (quasi-clone environment
                 :cached-function-information
                 (cons (merge-inline info inline)
                       (cached-function-information environment)))))

(defmethod add-function-type
    (client (environment environment) function-name type)
  (let ((info (function-information client environment function-name)))
    (quasi-clone environment
                 :cached-function-information
                 (cons (merge-function-type info type)
                       (cached-function-information environment)))))

(defmethod add-function-ignore
    (client (environment environment) function-name ignore)
  (let ((info (function-information client environment function-name)))
    (quasi-clone environment
                 :cached-function-information
                 (cons (merge-function-ignore info ignore)
                       (cached-function-information environment)))))

(defmethod add-function-dynamic-extent
    (client (environment environment) function-name)
  (let ((info (function-information client environment function-name)))
    (quasi-clone environment
                 :cached-function-information
                 (cons (merge-function-dynamic-extent info)
                       (cached-function-information environment)))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:speed)) value)
  (let ((info (optimize-information client environment)))
    (quasi-clone environment
                 :cached-optimize-information
                 (cons (merge-speed info value)
                       (cached-optimize-information environment)))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:compilation-speed)) value)
  (let ((info (optimize-information client environment)))
    (quasi-clone environment
                 :cached-optimize-information
                 (cons (merge-compilation-speed info value)
                       (cached-optimize-information environment)))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:debug)) value)
  (let ((info (optimize-information client environment)))
    (quasi-clone environment
                 :cached-optimize-information
                 (cons (merge-debug info value)
                       (cached-optimize-information environment)))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:safety)) value)
  (let ((info (optimize-information client environment)))
    (quasi-clone environment
                 :cached-optimize-information
                 (cons (merge-safety info value)
                       (cached-optimize-information environment)))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:space)) value)
  (let ((info (optimize-information client environment)))
    (quasi-clone environment
                 :cached-optimize-information
                 (cons (merge-space info value)
                       (cached-optimize-information environment)))))
