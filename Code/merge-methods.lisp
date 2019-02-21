(cl:in-package #:trucler)

(defmethod merge-type (client (description type-mixin) type)
  (quasi-clone description :type `(and type ,(type description))))

(defmethod merge-ignore (client (description ignore-mixin) ignore)
  (quasi-clone description :ignore ignore))

(defmethod merge-dynamic-extent (client (description dynamic-extent-mixin))
  (quasi-clone description :dynamic-extent t))

(defmethod merge-inline (client (description inline-mixin) inline)
  (quasi-clone description :inline inline))

(defmethod merge-speed (client (description speed-mixin) value)
  (quasi-clone description :speed value))

(defmethod merge-compilation-speed (client (description compilation-speed-mixin) value)
  (quasi-clone description :compilation-speed value))

(defmethod merge-debug (client (description debug-mixin) value)
  (quasi-clone description :debug value))

(defmethod merge-safety (client (description safety-mixin) value)
  (quasi-clone description :safety value))

(defmethod merge-space (client (description space-mixin) value)
  (quasi-clone description :space value))
