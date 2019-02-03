(cl:in-package #:trucler)

(defmethod merge-variable-type ((info type-mixin) type)
  (quasi-clone info :type `(and type ,(type info))))

(defmethod merge-function-type ((info type-mixin) type)
  (quasi-clone info :type `(and type ,(type info))))

(defmethod merge-variable-ignore ((info ignore-mixin) ignore)
  (quasi-clone info :ignore ignore))

(defmethod merge-function-ignore ((info ignore-mixin) ignore)
  (quasi-clone info :ignore ignore))

(defmethod merge-variable-dynamic-extent
    ((info dynamic-extent-mixin) dynamic-extent)
  (quasi-clone info :dynamic-extent dynamic-extent))

(defmethod merge-function-dynamic-extent
    ((info dynamic-extent-mixin) dynamic-extent)
  (quasi-clone info :dynamic-extent dynamic-extent))

(defmethod merge-inline ((info function-info) inline)
  (quasi-clone info :inline inline))
