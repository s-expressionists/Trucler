(cl:in-package #:trucler-reference)

(defmethod trucler:add-lexical-variable
    ((client client) (environment environment) symbol &optional identity)
  (trucler:augment-with-variable-description
   client environment
   (make-instance (trucler:lexical-variable-description-class client)
     :name symbol
     :identity identity)))

(defmethod trucler:add-special-variable
    ((client client) (environment environment) symbol)
  (trucler:augment-with-variable-description
   client environment
   (make-instance (trucler:special-variable-description-class client)
     :name symbol)))

(defmethod trucler:add-local-symbol-macro
    ((client client) (environment environment) symbol expansion)
  (trucler:augment-with-variable-description
   client environment
   (make-instance (trucler:local-symbol-macro-description-class client)
     :name symbol
     :expansion expansion)))

(defmethod trucler:add-local-function
    ((client client) (environment environment) symbol &optional identity)
  (trucler:augment-with-function-description
   client environment
   (make-instance (trucler:local-function-description-class client)
     :name symbol
     :identity identity)))

(defmethod trucler:add-local-macro
    ((client client) (environment environment) symbol expander)
  (trucler:augment-with-function-description
   client environment
   (make-instance (trucler:local-macro-description-class client)
     :name symbol
     :expander expander)))

(defmethod trucler:add-block
    ((client client) (environment environment) symbol &optional identity)
  (trucler:augment-with-block-description
   client environment
   (make-instance 'trucler:block-description
     :name symbol
     :identity identity)))

(defmethod trucler:add-tag
    ((client client) (environment environment) tag &optional identity)
  (trucler:augment-with-tag-description
   client environment
   (make-instance 'trucler:tag-description
     :name tag
     :identity identity)))

(defmethod trucler:add-variable-type
    ((client client) (environment environment) symbol type)
  (let ((description (trucler:describe-variable client environment symbol)))
    (trucler:augment-with-variable-description
     client environment
     (trucler:merge-type client description type))))

(defmethod trucler:add-variable-ignore
    ((client client) (environment environment) symbol ignore)
  (let ((description (trucler:describe-variable client environment symbol)))
    (trucler:augment-with-variable-description
     client environment
     (trucler:merge-ignore client description ignore))))

(defmethod trucler:add-variable-dynamic-extent
    ((client client) (environment environment) variable-name)
  (let ((description (trucler:describe-variable client environment variable-name)))
    (trucler:augment-with-variable-description
     client environment
     (trucler:merge-dynamic-extent client description))))

(defmethod trucler:add-inline
    ((client client) (environment environment) function-name inline)
  (let ((description (trucler:describe-function client environment function-name)))
    (loop while (null description)
          do (restart-case
                 (error 'trucler:undefined-function-referred-to-by-inline-declaration
                        :name function-name
                        :origin nil)
               (trucler:try-again ()
                 :report "Try to access description of function again"
                 (setf description
                       (trucler:describe-function client environment function-name)))
               (trucler:ignore-declaration ()
                 :report "Ignore the INLINE or NOTINLINE declaration"
                 (return-from trucler:add-inline environment))))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-inline client description inline))))

(defmethod trucler:add-inline-data
    ((client client) (environment environment) function-name inline-data)
  (let ((description (trucler:describe-function client environment function-name)))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-inline-data client description inline-data))))

(defmethod trucler:add-function-type
    ((client client) (environment environment) function-name type)
  (let ((description (trucler:describe-function client environment function-name)))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-type client description type))))

(defmethod trucler:add-function-ignore
    ((client client) (environment environment) function-name ignore)
  (let ((description (trucler:describe-function client environment function-name)))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-ignore client description ignore))))

(defmethod trucler:add-function-dynamic-extent
    ((client client) (environment environment) function-name)
  (let ((description (trucler:describe-function client environment function-name)))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-dynamic-extent client description))))

(defmethod trucler:add-speed
    ((client client) (environment environment) value)
  (let ((description (trucler:describe-optimize client environment)))
    (trucler:augment-with-optimize-description
     client environment
     (trucler:merge-speed client description value))))

(defmethod trucler:add-compilation-speed
    ((client client) (environment environment) value)
  (let ((description (trucler:describe-optimize client environment)))
    (trucler:augment-with-optimize-description
     client environment
     (trucler:merge-compilation-speed client description value))))

(defmethod trucler:add-debug
    ((client client) (environment environment) value)
  (let ((description (trucler:describe-optimize client environment)))
    (trucler:augment-with-optimize-description
     client environment
     (trucler:merge-debug client description value))))

(defmethod trucler:add-safety
    ((client client) (environment environment) value)
  (let ((description (trucler:describe-optimize client environment)))
    (trucler:augment-with-optimize-description
     client environment
     (trucler:merge-safety client description value))))

(defmethod trucler:add-space
    ((client client) (environment environment) value)
  (let ((description (trucler:describe-optimize client environment)))
    (trucler:augment-with-optimize-description
     client environment
     (trucler:merge-space client description value))))
