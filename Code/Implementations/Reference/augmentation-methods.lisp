(cl:in-package #:trucler-reference)

(defmethod trucler:add-lexical-variable
    ((client client) (environment environment) name &optional identity)
  (trucler:augment-with-variable-description
   client environment
   (make-instance (trucler:lexical-variable-description-class client)
     :name name
     :identity identity)))

(defmethod trucler:add-local-special-variable
    ((client client) (environment environment) name)
  (trucler:augment-with-variable-description
   client environment
   (make-instance (trucler:local-special-variable-description-class client)
     :name name)))

(defmethod trucler:add-local-symbol-macro
    ((client client) (environment environment) name expansion)
  (trucler:augment-with-variable-description
   client environment
   (make-instance (trucler:local-symbol-macro-description-class client)
     :name name
     :expansion expansion)))

(defmethod trucler:add-local-function
    ((client client) (environment environment) name &optional identity)
  (trucler:augment-with-function-description
   client environment
   (make-instance (trucler:local-function-description-class client)
     :name name
     :identity identity)))

(defmethod trucler:add-local-macro
    ((client client) (environment environment) name expander)
  (trucler:augment-with-function-description
   client environment
   (make-instance (trucler:local-macro-description-class client)
     :name name
     :expander expander)))

(defmethod trucler:add-block
    ((client client) (environment environment) name &optional identity)
  (trucler:augment-with-block-description
   client environment
   (make-instance (trucler:block-description-class client)
     :name name
     :identity identity)))

(defmethod trucler:add-tag
    ((client client) (environment environment) name &optional identity)
  (trucler:augment-with-tag-description
   client environment
   (make-instance (trucler:tag-description-class client)
     :name name
     :identity identity)))

(defmethod trucler:add-variable-type
    ((client client) (environment environment) name type)
  (let ((description (trucler:describe-variable client environment name)))
    (trucler:augment-with-variable-description
     client environment
     (trucler:merge-type client description type))))

(defmethod trucler:add-variable-ignore
    ((client client) (environment environment) name ignore)
  (let ((description (trucler:describe-variable client environment name)))
    (trucler:augment-with-variable-description
     client environment
     (trucler:merge-ignore client description ignore))))

(defmethod trucler:add-variable-dynamic-extent
    ((client client) (environment environment) name)
  (let ((description (trucler:describe-variable client environment name)))
    (trucler:augment-with-variable-description
     client environment
     (trucler:merge-dynamic-extent client description))))

(defmethod trucler:add-inline
    ((client client) (environment environment) name inline)
  (let ((description (trucler:describe-function client environment name)))
    (loop while (null description)
          do (restart-case
                 (error 'trucler:undefined-function-referred-to-by-inline-declaration
                        :name name
                        :origin nil)
               (trucler:try-again ()
                 :report "Try to access description of function again"
                 (setf description
                       (trucler:describe-function client environment name)))
               (trucler:ignore-declaration ()
                 :report "Ignore the INLINE or NOTINLINE declaration"
                 (return-from trucler:add-inline environment))))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-inline client description inline))))

(defmethod trucler:add-inline-data
    ((client client) (environment environment) name inline-data)
  (let ((description (trucler:describe-function client environment name)))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-inline-data client description inline-data))))

(defmethod trucler:add-function-type
    ((client client) (environment environment) name type)
  (let ((description (trucler:describe-function client environment name)))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-type client description type))))

(defmethod trucler:add-function-ignore
    ((client client) (environment environment) name ignore)
  (let ((description (trucler:describe-function client environment name)))
    (trucler:augment-with-function-description
     client environment
     (trucler:merge-ignore client description ignore))))

(defmethod trucler:add-function-dynamic-extent
    ((client client) (environment environment) name)
  (let ((description (trucler:describe-function client environment name)))
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
