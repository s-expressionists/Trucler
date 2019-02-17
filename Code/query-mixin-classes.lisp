(cl:in-package #:trucler)

(defmacro define-mixin-class (class-name
                              slot-name
                              initarg
                              reader-name
                              &optional (initform nil initform-p))
  `(progn (defclass ,class-name ()
            ((,slot-name :initform
                         ,(if initform-p
                              initform
                              `(error "Initarg ~s must be given." ,initarg))
                         :initarg ,initarg
                         :reader ,reader-name)))

          (defmethod clone-info append ((object ,class-name))
            '((,initarg ,reader-name)))))

(define-mixin-class name-mixin %name :name name)

(define-mixin-class identity-mixin %identity :identity identity)

(define-mixin-class type-mixin %type :type type t)

(define-mixin-class ignore-mixin %ignore :ignore ignore nil)

(define-mixin-class dynamic-extent-mixin
    %dynamic-extent :dynamic-extent dynamic-extent nil)

(define-mixin-class compiler-macro-mixin
    %compiler-macro :compiler-macro compiler-macro nil)

(define-mixin-class expansion-mixin %expansion :expansion expansion)

(define-mixin-class expander-mixin %expander :expander expander)

(define-mixin-class class-name-mixin %class-name :class-name class-name)
