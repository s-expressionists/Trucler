(cl:in-package #:trucler)

(defclass environment ()
  ((%function-infos
    :initform '()
    :initarg :function-infos
    :reader function-infos)
   (%variable-infos
    :initform '()
    :initarg :variable-infos
    :reader variable-infos)
   (%block-infos
    :initform '()
    :initarg :block-infos
    :reader block-infos)
   (%tag-infos
    :initform '()
    :initarg :tag-infos
    :reader tag-infos)
   (%optimization-infos
    :initform '()
    :initarg :optimization-infos
    :reader optimization-infos)))

   
