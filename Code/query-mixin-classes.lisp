(cl:in-package #:trucler)

(defmacro define-mixin-class (class-name
                              slot-name
                              initarg
                              reader-name
                              &optional (initform nil initform-p))
  `(progn (defclass ,class-name ()
            ((,slot-name :initform ,(if initform-p
                                        initform
                                        `(error "Initarg ~s must be given." ,initarg))
                         :initarg ,initarg
                         :reader ,reader-name)))

          (defmethod clone-info append ((object ,class-name))
            '((,initarg ,reader-name)))))

(define-mixin-class name-mixin %name :name name)

(define-mixin-class identity-mixin %identity :identity identity)

(define-mixin-class type-mixin %type :type type)

(defclass type-mixin ()
  ((%type :initform t :initarg :type :reader type)))

(defmethod clone-info append ((object type-mixin))
  `((:type type)))

(defclass ignore-mixin ()
  ((%ignore :initform nil :initarg :ignore :reader ignore)))

(defmethod clone-info append ((object ignore-mixin))
  `((:ignore ignore)))

(defclass dynamic-extent-mixin ()
  ((%dynamic-extent :initform nil
                    :initarg :dynamic-extent
                    :reader dynamic-extent)))

(defmethod clone-info append ((object dynamic-extent-mixin))
  `((:dynamic-extent dynamic-extent)))

(defclass compiler-macro-mixin ()
  ((%compiler-macro :initform nil
                    :initarg :compiler-macro
                    :reader compiler-macro)))

(defmethod clone-info append ((object compiler-macro-mixin))
  `((:compiler-macro compiler-macro)))

(defclass expansion-mixin ()
  ((%expansion :initarg :expansion :reader expansion)))

(defmethod clone-info append ((object expansion-mixin))
  `((:expansion expansion)))

(defclass expander-mixin ()
  ((%expander :initarg :expander :reader expander)))

(defmethod clone-info append ((object expander-mixin))
  `((:expander expander)))

(defclass class-name-mixin ()
  ((%class-name :initarg :class-name :reader class-name)))

(defmethod clone-info append ((object class-name-mixin))
  `((:class-name class-name)))

