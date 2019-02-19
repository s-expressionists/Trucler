(cl:in-package #:trucler)

(defmethod merge-variable-type (client (info type-mixin) type)
  (quasi-clone info :type `(and type ,(type info))))

(defmethod merge-function-type (client (info type-mixin) type)
  (quasi-clone info :type `(and type ,(type info))))

(defmethod merge-variable-ignore (client (info ignore-mixin) ignore)
  (quasi-clone info :ignore ignore))

(defmethod merge-function-ignore (client (info ignore-mixin) ignore)
  (quasi-clone info :ignore ignore))

(defmethod merge-variable-dynamic-extent (client (info dynamic-extent-mixin))
  (quasi-clone info :dynamic-extent t))

(defmethod merge-function-dynamic-extent (client (info dynamic-extent-mixin))
  (quasi-clone info :dynamic-extent t))

(defmethod merge-inline (client (info function-information) inline)
  (quasi-clone info :inline inline))

(defmethod merge-speed (client (info optimize-information) value)
  (quasi-clone info :speed value))

(defmethod merge-compilation-speed (client (info optimize-information) value)
  (quasi-clone info :compilation-speed value))

(defmethod merge-debug (client (info optimize-information) value)
  (quasi-clone info :debug value))

(defmethod merge-safety (client (info optimize-information) value)
  (quasi-clone info :safety value))

(defmethod merge-space (client (info optimize-information) value)
  (quasi-clone info :space value))
