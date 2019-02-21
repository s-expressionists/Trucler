(cl:in-package #:trucler)

(defmethod add-lexical-variable
    (client (environment environment) symbol &optional identity)
  (augment-with-variable-description
   client environment
   (make-instance 'lexical-variable-description
     :name symbol
     :identity identity)))

(defmethod add-special-variable
    (client (environment environment) symbol)
  (augment-with-variable-description
   client environment
   (make-instance 'special-variable-description
     :name symbol)))

(defmethod add-local-symbol-macro
    (client (environment environment) symbol expansion)
  (augment-with-variable-description
   client environment
   (make-instance 'local-symbol-macro-description
     :name symbol
     :expansion expansion)))

(defmethod add-local-function
    (client (environment environment) symbol &optional identity)
  (augment-with-function-description
   client environment
   (make-instance 'local-function-description
     :name symbol
     :identity identity)))

(defmethod add-local-macro
    (client (environment environment) symbol expander)
  (augment-with-function-description
   client environment
   (make-instance 'local-macro-description
     :name symbol
     :expander expander)))

(defmethod add-block
    (client (environment environment) symbol &optional identity)
  (augment-with-block-description
   client environment
   (make-instance 'block-description
     :name symbol
     :identity identity)))

(defmethod add-tag
    (client (environment environment) tag &optional identity)
  (augment-with-tag-description
   client environment
   (make-instance 'tag-description
     :name tag
     :identity identity)))

(defmethod add-variable-type
    (client (environment environment) symbol type)
  (let ((description (describe-variable client environment symbol)))
    (augment-with-variable-description
     client environment
     (merge-type client description type))))

(defmethod add-variable-ignore
    (client (environment environment) symbol ignore)
  (let ((description (describe-variable client environment symbol)))
    (augment-with-variable-description
     client environment
     (merge-ignore client description ignore))))

(defmethod add-variable-dynamic-extent
    (client (environment environment) variable-name)
  (let ((description (describe-variable client environment variable-name)))
    (augment-with-variable-description
     client environment
     (merge-dynamic-extent client description))))

(defmethod add-inline
    (client (environment environment) function-name inline)
  (let ((description (describe-function client environment function-name)))
    (augment-with-function-description
     client environment
     (merge-inline client description inline))))

(defmethod add-function-type
    (client (environment environment) function-name type)
  (let ((description (describe-function client environment function-name)))
    (augment-with-function-description
     client environment
     (merge-type client description type))))

(defmethod add-function-ignore
    (client (environment environment) function-name ignore)
  (let ((description (describe-function client environment function-name)))
    (augment-with-function-description
     client environment
     (merge-ignore client description ignore))))

(defmethod add-function-dynamic-extent
    (client (environment environment) function-name)
  (let ((description (describe-function client environment function-name)))
    (augment-with-function-description
     client environment
     (merge-dynamic-extent client description))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:speed)) value)
  (let ((description (describe-optimize client environment)))
    (augment-with-optimize-description
     client environment
     (merge-speed client description value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:compilation-speed)) value)
  (let ((description (describe-optimize client environment)))
    (augment-with-optimize-description
     client environment
     (merge-compilation-speed client description value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:debug)) value)
  (let ((description (describe-optimize client environment)))
    (augment-with-optimize-description
     client environment
     (merge-debug client description value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:safety)) value)
  (let ((description (describe-optimize client environment)))
    (augment-with-optimize-description
     client environment
     (merge-safety client description value))))

(defmethod add-optimize
    (client (environment environment) (quality (eql 'cl:space)) value)
  (let ((description (describe-optimize client environment)))
    (augment-with-optimize-description
     client environment
     (merge-space client description value))))

