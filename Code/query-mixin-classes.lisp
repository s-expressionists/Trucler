(cl:in-package #:trucler)

(defmacro define-mixin-class
    (class-name
     slot-name
     initarg
     reader-name
     &key
       (initform `(error "Initarg ~s must be given." ,initarg))
       (type t))
  `(progn (defclass ,class-name ()
            ((,slot-name :initform ,initform
                         :type ,type
                         :initarg ,initarg
                         :reader ,reader-name)))

          (defmethod cloning-information append ((object ,class-name))
            '((,initarg ,reader-name)))))

(define-mixin-class name-mixin
    %name :name name)

(define-mixin-class identity-mixin
    %identity :identity identity)

(define-mixin-class type-mixin
    %type :type type
    :initform t)

(define-mixin-class ignore-mixin
    %ignore :ignore ignore
    :initform nil)

(define-mixin-class dynamic-extent-mixin
    %dynamic-extent :dynamic-extent dynamic-extent
    :initform nil)

(define-mixin-class value-mixin
    %value :value value)

(define-mixin-class compiler-macro-mixin
    %compiler-macro :compiler-macro compiler-macro
    :initform nil)

(define-mixin-class expansion-mixin
    %expansion :expansion expansion)

(define-mixin-class expander-mixin
    %expander :expander expander)

(define-mixin-class class-name-mixin
    %class-name :class-name class-name)

(define-mixin-class inline-mixin
    %inline :inline inline
    :initform nil
    :type (member nil cl:inline cl:notinline))

(define-mixin-class method-class-name-mixin
    %method-class-name :method-class-name method-class-name
    :initform 'standard-method)

(define-mixin-class speed-mixin
    %speed :speed speed)

(define-mixin-class compilation-speed-mixin
    %compilation-speed :compilation-speed compilation-speed)

(define-mixin-class debug-mixin
    %debug :debug debug)

(define-mixin-class space-mixin
    %space :space space)

(define-mixin-class safety-mixin
    %safety :safety safety)

(define-mixin-class superclass-names-mixin
    %superclass-names :superclass-names superclass-names
    :initform '())

(define-mixin-class metaclass-name-mixin
    %metaclass-name :metaclass-name metaclass-name
    :initform 'standard-class)
