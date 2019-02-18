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

(defmethod merge-inline ((info function-information) inline)
  (quasi-clone info :inline inline))

(defmethod merge-speed ((info optimize-information) value)
  (quasi-clone info :speed value))

(defmethod merge-compilation-speed ((info optimize-information) value)
  (quasi-clone info :compilation-speed value))

(defmethod merge-debug ((info optimize-information) value)
  (quasi-clone info :debug value))

(defmethod merge-safety ((info optimize-information) value)
  (quasi-clone info :safety value))

(defmethod merge-space ((info optimize-information) value)
  (quasi-clone info :space value))
