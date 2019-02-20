(cl:in-package #:trucler)

(defmethod add-lexical-variable
    (client (environment environment) symbol &optional identity)
  (augment-with-variable-information
   client environment
   (make-instance 'lexical-variable-information
     :name symbol
     :identity identity)))

(defmethod add-special-variable
    (client (environment environment) symbol)
  (augment-with-variable-information
   client environment
   (make-instance 'special-variable-information
     :name symbol)))

(defmethod add-local-symbol-macro
    (client (environment environment) symbol expansion)
  (augment-with-variable-information
   client environment
   (make-instance 'local-symbol-macro-information
     :name symbol
     :expansion expansion)))

(defmethod add-local-function
    (client (environment environment) symbol &optional identity)
  (augment-with-function-information
   client environment
   (make-instance 'local-function-information
     :name symbol
     :identity identity)))

(defmethod add-local-macro
    (client (environment environment) symbol expander)
  (augment-with-function-information
   client environment
   (make-instance 'local-macro-information
     :name symbol
     :expander expander)))

(defmethod add-block
    (client (environment environment) symbol &optional identity)
  (augment-with-block-information
   client environment
   (make-instance 'block-information
     :name symbol
     :identity identity)))

(defmethod add-tag
    (client (environment environment) tag &optional identity)
  (augment-with-tag-information
   client environment
   (make-instance 'tag-information
     :name tag
     :identity identity)))

(defmethod add-variable-type
    (client (environment environment) symbol type)
  (let ((info (variable-information client environment symbol)))
    (augment-with-variable-information
     client environment
     (merge-type info type))))

(defmethod add-variable-ignore
    (client (environment environment) symbol ignore)
  (let ((info (variable-information client environment symbol)))
    (augment-with-variable-information
     client environment
     (merge-ignore info ignore))))

(defmethod add-variable-dynamic-extent
    (client (environment environment) variable-name)
  (let ((info (variable-information client environment variable-name)))
    (augment-with-variable-information
     client environment
     (merge-dynamic-extent info))))

(defmethod add-inline
    (client (environment environment) function-name inline)
  (let ((info (function-information client environment function-name)))
    (augment-with-function-information
     client environment
     (merge-inline info inline))))

(defmethod add-function-type
    (client (environment environment) function-name type)
  (let ((info (function-information client environment function-name)))
    (augment-with-function-information
     client environment
     (merge-function-type info type))))

(defmethod add-function-ignore
    (client (environment environment) function-name ignore)
  (let ((info (function-information client environment function-name)))
    (augment-with-function-information
     client environment
     (merge-function-ignore info ignore))))

(defmethod add-function-dynamic-extent
    (client (environment environment) function-name)
  (let ((info (function-information client environment function-name)))
    (augment-with-function-information
     client environment
     (merge-function-dynamic-extent info))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:speed)) value)
  (let ((info (optimize-information client environment)))
    (augment-with-optimize-information
     client environment
     (merge-speed info value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:compilation-speed)) value)
  (let ((info (optimize-information client environment)))
    (augment-with-optimize-information
     client environment
     (merge-compilation-speed info value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:debug)) value)
  (let ((info (optimize-information client environment)))
    (augment-with-optimize-information
     client environment
     (merge-debug info value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:safety)) value)
  (let ((info (optimize-information client environment)))
    (augment-with-optimize-information
     client environment
     (merge-safety info value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:space)) value)
  (let ((info (optimize-information client environment)))
    (augment-with-optimize-information
     client environment
     (merge-space info value))))

