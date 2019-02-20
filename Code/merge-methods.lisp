(cl:in-package #:trucler)

(defmethod merge-type (client (info type-mixin) type)
  (quasi-clone info :type `(and type ,(type info))))

(defmethod merge-ignore (client (info ignore-mixin) ignore)
  (quasi-clone info :ignore ignore))

(defmethod merge-dynamic-extent (client (info dynamic-extent-mixin))
  (quasi-clone info :dynamic-extent t))

(defmethod merge-inline (client (info inline-mixin) inline)
  (quasi-clone info :inline inline))

(defmethod merge-speed (client (info speed-mixin) value)
  (quasi-clone info :speed value))

(defmethod merge-compilation-speed (client (info compilation-speed-mixin) value)
  (quasi-clone info :compilation-speed value))

(defmethod merge-debug (client (info debug-mixin) value)
  (quasi-clone info :debug value))

(defmethod merge-safety (client (info safety-mixin) value)
  (quasi-clone info :safety value))

(defmethod merge-space (client (info space-mixin) value)
  (quasi-clone info :space value))
