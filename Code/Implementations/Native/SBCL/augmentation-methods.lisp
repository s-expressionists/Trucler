(cl:in-package #:trucler-native-sbcl)

;;; Types are assumed to be plain type specifiers.
;;; TRUCLER:INLINE-DATA is not implemented, nor are the low-level
;;; augmentation methods defined by Trucler.
;;; Identities, expansions and expanders are assumed to be correct and
;;; passed on to the augmented environment as is.

;;; The query factories are more useful when using Trucler's reference
;;; environment, so that when looking up descriptions, the desired
;;; objects are returned.
;;; SBCL's low-level augmentation methods just use the name, identity,
;;; expansion and expanders, and also the optimize information readers.

(defmethod trucler:add-lexical-variable
    ((client client) (environment null) name &optional identity)
  (trucler:add-lexical-variable
   client *null-lexical-environment* name identity))

(defmethod trucler:add-lexical-variable
    ((client client) (environment sb-kernel:lexenv) name
     &optional (identity (make-lexical-variable-identity name)))
  (quasi-clone-environment
   environment :variables (cons (cons name identity)
                                (sb-c::lexenv-vars environment))))

(defmethod trucler:add-local-special-variable
    ((client client) (environment null) name)
  (trucler:add-local-special-variable client *null-lexical-environment* name))

(defmethod trucler:add-local-special-variable
    ((client client) (environment sb-kernel:lexenv) name)
  (augment-with-declaration-specifier environment `(special ,name)))

(defmethod trucler:add-local-symbol-macro
    ((client client) (environment null) name expansion)
  (trucler:add-local-symbol-macro
   client *null-lexical-environment* name expansion))

(defmethod trucler:add-local-symbol-macro
    ((client client) (environment sb-kernel:lexenv) name expansion)
  (quasi-clone-environment
   environment :variables (cons (cons name (cons 'sb-sys::macro expansion))
                                (sb-c::lexenv-vars environment))))

(defmethod trucler:add-local-function
    ((client client) (environment null) name &optional identity)
  (trucler:add-local-function
   client *null-lexical-environment* name identity))

(defmethod trucler:add-local-function
    ((client client) (environment sb-kernel:lexenv) name
     &optional (identity (make-local-function-identity name)))
  (quasi-clone-environment
   environment :functions (cons (cons name identity)
                                (sb-c::lexenv-funs environment))))

(defmethod trucler:add-local-macro
    ((client client) (environment null) name expander)
  (trucler:add-local-macro
   client *null-lexical-environment* name expander))

(defmethod trucler:add-local-macro
    ((client client) (environment sb-kernel:lexenv) name expander)
  (quasi-clone-environment
   environment :functions (cons (cons name (cons 'sb-sys::macro expander))
                                (sb-c::lexenv-funs environment))))

(defmethod trucler:add-block
    ((client client) (environment null) name &optional identity)
  (trucler:add-block client *null-lexical-environment* name identity))

(defmethod trucler:add-block
    ((client client) (environment sb-kernel:lexenv) name &optional identity)
  (quasi-clone-environment
   environment :blocks (cons (cons name identity)
                             (sb-c::lexenv-blocks environment))))

(defmethod trucler:add-tag
    ((client client) (environment null) name &optional identity)
  (trucler:add-tag client *null-lexical-environment* name identity))

(defmethod trucler:add-tag
    ((client client) (environment sb-kernel:lexenv) name &optional identity)
  (quasi-clone-environment
   environment :tags (cons (cons name identity)
                           (sb-c::lexenv-tags environment))))

(defmethod trucler:add-variable-type
    ((client client) (environment null) name type)
  (trucler:add-variable-type client *null-lexical-environment* name type))

(defmethod trucler:add-variable-type
    ((client client) (environment sb-kernel:lexenv) name type)
  ;; The special handling of local symbol macro descriptions is required
  ;; because SB-CLTL2 seems unable to add a type to a local symbol
  ;; macro.
  ;; The following call, which is essentially equivalent to
  ;; TRUCLER:ADD-LOCAL-SYMBOL-MACRO followed by
  ;; AUGMENT-WITH-VARIABLE-ANNOTATION, fails on SBCL but succeeds on
  ;; CCL:
  ;;
  ;;   (trivial-cltl2:augment-environment nil :symbol-macro '((b 2)) :declare '((fixnum b)))
  (let ((description (trucler:describe-variable client environment name)))
    (etypecase description
      (trucler:local-symbol-macro-description
       (trucler:add-local-symbol-macro client environment name
                                       `(the ,type ,(trucler:expansion description))))
      (t
       (augment-with-variable-annotation environment description type)))))

(defmethod trucler:add-variable-ignore
    ((client client) (environment null) name ignore)
  (trucler:add-variable-ignore client *null-lexical-environment* name ignore))

(defmethod trucler:add-variable-ignore
    ((client client) (environment sb-kernel:lexenv) name ignore)
  (augment-with-variable-annotation
   environment (trucler:describe-variable client environment name) ignore))

(defmethod trucler:add-variable-dynamic-extent
    ((client client) (environment null) name)
  (trucler:add-variable-dynamic-extent client *null-lexical-environment* name))

(defmethod trucler:add-variable-dynamic-extent
    ((client client) (environment sb-kernel:lexenv) name)
  (augment-with-variable-annotation
   environment
   (trucler:describe-variable client environment name)
   'dynamic-extent))

(defmethod trucler:add-function-type
    ((client client) (environment null) name type)
  (trucler:add-function-type client *null-lexical-environment* name type))

(defmethod trucler:add-function-type
    ((client client) (environment sb-kernel:lexenv) name type)
  (augment-with-function-annotation
   environment (trucler:describe-function client environment name) type))

(defmethod trucler:add-inline
    ((client client) (environment null) name inline)
  (trucler:add-inline client *null-lexical-environment* name inline))

(defmethod trucler:add-inline
    ((client client) (environment sb-kernel:lexenv) name inline)
  (let ((description (trucler:describe-function client environment name)))
    (loop while (null description)
          do (restart-case
                 (error 'trucler:undefined-function-referred-to-by-inline-declaration
                        :name name
                        :origin nil)
               (trucler:try-again ()
                 :report "Try to access description of function again"
                 (setf description
                       (trucler:describe-function client environment name)))
               (trucler:ignore-declaration ()
                 :report "Ignore the INLINE or NOTINLINE declaration"
                 (return-from trucler:add-inline environment))))
    (augment-with-function-annotation environment description inline)))

(defmethod trucler:add-function-ignore
    ((client client) (environment null) name ignore)
  (trucler:add-function-ignore client *null-lexical-environment* name ignore))

(defmethod trucler:add-function-ignore
    ((client client) (environment sb-kernel:lexenv) name ignore)
  (augment-with-function-annotation
   environment (trucler:describe-function client environment name) ignore))

(defmethod trucler:add-function-dynamic-extent
    ((client client) (environment null) name)
  (trucler:add-function-dynamic-extent client *null-lexical-environment* name))

(defmethod trucler:add-function-dynamic-extent
    ((client client) (environment sb-kernel:lexenv) name)
  (augment-with-function-annotation
   environment
   (trucler:describe-function client environment name)
   'dynamic-extent))

(defmethod trucler:add-speed
    ((client client) (environment null) value)
  (trucler:add-speed client *null-lexical-environment* value))

(defmethod trucler:add-speed
    ((client client) (environment sb-kernel:lexenv) value)
  (augment-with-optimize-quality environment 'speed value))

(defmethod trucler:add-compilation-speed
    ((client client) (environment null) value)
  (trucler:add-compilation-speed client *null-lexical-environment* value))

(defmethod trucler:add-compilation-speed
    ((client client) (environment sb-kernel:lexenv) value)
  (augment-with-optimize-quality environment 'compilation-speed value))

(defmethod trucler:add-debug
    ((client client) (environment null) value)
  (trucler:add-debug client *null-lexical-environment* value))

(defmethod trucler:add-debug
    ((client client) (environment sb-kernel:lexenv) value)
  (augment-with-optimize-quality environment 'debug value))

(defmethod trucler:add-space
    ((client client) (environment null) value)
  (trucler:add-space client *null-lexical-environment* value))

(defmethod trucler:add-space
    ((client client) (environment sb-kernel:lexenv) value)
  (augment-with-optimize-quality environment 'space value))

(defmethod trucler:add-safety
    ((client client) (environment null) value)
  (trucler:add-safety client *null-lexical-environment* value))

(defmethod trucler:add-safety
    ((client client) (environment sb-kernel:lexenv) value)
  (augment-with-optimize-quality environment 'safety value))
