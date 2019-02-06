(cl:in-package #:trucler)

(defmethod merge-variable-type ((info type-mixin) type)
  (quasi-clone info :type `(and type ,(type info))))

(defmethod merge-function-type ((info type-mixin) type)
  (quasi-clone info :type `(and type ,(type info))))

(defmethod merge-variable-ignore ((info ignore-mixin) ignore)
  (quasi-clone info :ignore ignore))

(defmethod merge-function-ignore ((info ignore-mixin) ignore)
  (quasi-clone info :ignore ignore))

(defmethod merge-variable-dynamic-extent ((info dynamic-extent-mixin))
  (quasi-clone info :dynamic-extent t))

(defmethod merge-function-dynamic-extent ((info dynamic-extent-mixin))
  (quasi-clone info :dynamic-extent t))

(defmethod merge-inline ((info function-info) inline)
  (quasi-clone info :inline inline))
