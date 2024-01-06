(cl:in-package #:trucler-native-test)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar *client* (make-instance 'trucler-native:client)))

(declaim (notinline touch))
(defun touch (x)
  (declare (ignore x))
  (values))

(defun boolean= (a b)
  (if (not a)
      (not b)
      (and b t)))

(defun make-lexical-variable-identity (name)
  #+sbcl (trucler-native-sbcl::make-lexical-variable-identity name)
  #-sbcl (declare (ignore name))
  #-sbcl nil)

(defun make-local-function-identity (name)
  #+sbcl (trucler-native-sbcl::make-local-function-identity name)
  #-sbcl (declare (ignore name))
  #-sbcl nil)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Variables

(defun assert-lexical-variable
    (environment name
     &key (type t) (ignore nil) (dynamic-extent nil) (identity nil identity-p))
  (let ((description (trucler:describe-variable *client* environment name)))
    (check-type description trucler:lexical-variable-description)
    (assert (eq (trucler:name description) name))
    (assert (subtypep (trucler:type description) type))
    (assert (eq (trucler:ignore description) ignore))
    (assert (boolean= (trucler:dynamic-extent description) dynamic-extent))
    (when identity-p
      (assert (eq (trucler:identity description) identity)))))

(defmacro assert-lexical-variable-description
    (name &rest args &key type ignore dynamic-extent &environment environment)
  (declare (ignore type dynamic-extent))
  (apply #'assert-lexical-variable environment name args)
  (unless (eq ignore 'cl:ignore)
    `(touch ,name)))

(defmacro assert-add-lexical-variable
    (name &rest args
     &key (type t type-p)
       (ignore nil ignore-p)
       (dynamic-extent nil dynamic-extent-p)
       (identity (make-lexical-variable-identity name))
     &environment environment)
  (setf environment (trucler:add-lexical-variable
                     *client* environment name identity))
  (when type-p
    (setf environment (trucler:add-variable-type
                       *client* environment name type)))
  (when ignore-p
    (setf environment (trucler:add-variable-ignore
                       *client* environment name ignore)))
  (when dynamic-extent-p
    (assert (not (null dynamic-extent)))
    (setf environment (trucler:add-variable-dynamic-extent
                       *client* environment name)))
  (apply #'assert-lexical-variable environment name args))

(defun assert-local-special-variable
    (environment name &key (type t))
  ;; Ignoring special variables is a style-warning, so skip ignore.
  ;; Also, SBCL does not seem to store dynamic-extent information;
  ;; possibly other implementations will not either.
  (let ((description (trucler:describe-variable *client* environment name)))
    (check-type description trucler:local-special-variable-description)
    (assert (eq (trucler:name description) name))
    (assert (subtypep (trucler:type description) type))))

(defmacro assert-local-special-variable-description
    (name &rest args &key type &environment environment)
  (declare (ignore type))
  (apply #'assert-local-special-variable environment name args)
  `(touch ,name))

(defmacro assert-add-local-special-variable
    (name &rest args &key (type t type-p) &environment environment)
  (setf environment (trucler:add-local-special-variable
                     *client* environment name))
  (when type-p
    (setf environment (trucler:add-variable-type
                       *client* environment name type)))
  (apply #'assert-local-special-variable environment name args))

(defun assert-global-special-variable
    (environment name &key (type t))
  ;; Global ignore and dynamic-extent declarations are unrecognized on
  ;; SBCL; possibly on other implementations too.
  (let ((description (trucler:describe-variable *client* environment name)))
    (check-type description trucler:global-special-variable-description)
    (assert (eq (trucler:name description) name))
    (assert (subtypep (trucler:type description) type))))

(defmacro assert-global-special-variable-description
    (name &rest args &key type &environment environment)
  (declare (ignore type))
  (apply #'assert-global-special-variable environment name args)
  `(touch ,name))

(defun assert-constant-variable
    (environment name &key (value nil value-p))
  ;; Global ignore declaration is unrecognized on SBCL; possibly on
  ;; other implementations too.
  (let ((description (trucler:describe-variable *client* environment name)))
    (check-type description trucler:constant-variable-description)
    (assert (eq (trucler:name description) name))
    (when value-p
      (assert (eql (trucler:value description) value)))))

(defmacro assert-constant-variable-description
    (name &rest args &key value &environment environment)
  (declare (ignore value))
  (apply #'assert-constant-variable environment name args)
  `(touch ,name))

(defun assert-local-symbol-macro
    (environment name &key (type t) (expansion nil expansion-p))
  ;; Ignore declarations are ignored on SBCL; possibly on other
  ;; implementations too.
  (let ((description (trucler:describe-variable *client* environment name)))
    (check-type description trucler:local-symbol-macro-description)
    (assert (eq (trucler:name description) name))
    (assert (subtypep (trucler:type description) type))
    (when expansion-p
      (assert (equal (trucler:expansion description) expansion)))))

(defmacro assert-local-symbol-macro-description
    (name &rest args &key type expansion &environment environment)
  (declare (ignore type expansion))
  (apply #'assert-local-symbol-macro environment name args)
  `(touch ,name))

(defmacro assert-add-local-symbol-macro
    (name expansion &rest args &key (type t type-p) &environment environment)
  (setf environment (trucler:add-local-symbol-macro
                     *client* environment name expansion))
  (when type-p
    (setf environment (trucler:add-variable-type
                       *client* environment name type)))
  (apply #'assert-local-symbol-macro environment name args))

(defun assert-global-symbol-macro
    (environment name &key (type t) (expansion nil expansion-p))
  ;; Global ignore declaration is unrecognized on SBCL; possibly on
  ;; other implementations too.
  (let ((description (trucler:describe-variable *client* environment name)))
    (check-type description trucler:global-symbol-macro-description)
    (assert (eq (trucler:name description) name))
    (assert (subtypep (trucler:type description) type))
    (when expansion-p
      (assert (equal (trucler:expansion description) expansion)))))

(defmacro assert-global-symbol-macro-description
    (name &rest args &key type expansion &environment environment)
  (declare (ignore type expansion))
  (apply #'assert-global-symbol-macro environment name args)
  `(touch ,name))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Functions

(defun assert-local-function
    (environment name
     &key (type t) (inline nil) (ignore nil) (dynamic-extent nil)
       (identity nil identity-p))
  (let ((description (trucler:describe-function *client* environment name)))
    (check-type description trucler:local-function-description)
    (assert (equal (trucler:name description) name))
    (assert (subtypep (trucler:type description) type))
    (assert (eq (trucler:inline description) inline))
    (assert (eq (trucler:ignore description) ignore))
    (assert (boolean= (trucler:dynamic-extent description) dynamic-extent))
    (when identity-p
      (assert (eq (trucler:identity description) identity)))))

(defmacro assert-local-function-description
    (name &rest args &key type inline ignore dynamic-extent
     &environment environment)
  (declare (ignore type inline dynamic-extent))
  (apply #'assert-local-function environment name args)
  (unless (eq ignore 'cl:ignore)
    `(touch #',name)))

(defmacro assert-add-local-function
    (name &rest args
     &key (type t type-p)
       (inline nil inline-p)
       (ignore nil ignore-p)
       (dynamic-extent nil dynamic-extent-p)
       (identity (make-local-function-identity name))
     &environment environment)
  (setf environment (trucler:add-local-function
                     *client* environment name identity))
  (when type-p
    (setf environment (trucler:add-function-type
                       *client* environment name type)))
  (when inline-p
    (setf environment (trucler:add-inline
                       *client* environment name inline)))
  (when ignore-p
    (setf environment (trucler:add-function-ignore
                       *client* environment name ignore)))
  (when dynamic-extent-p
    (assert (not (null dynamic-extent)))
    (setf environment (trucler:add-function-dynamic-extent
                       *client* environment name)))
  (apply #'assert-local-function environment name args))

(defun assert-global-function
    (environment name &key (type t) (inline nil) require-compiler-macro)
  ;; Global ignore and dynamic-extent declarations are unrecognized on
  ;; SBCL; possibly on other implementations too.
  (let ((description (trucler:describe-function *client* environment name)))
    (check-type description trucler:global-function-description)
    (assert (equal (trucler:name description) name))
    (assert (subtypep (trucler:type description) type))
    (assert (eq (trucler:inline description) inline))
    (cond (require-compiler-macro
           (assert (functionp (trucler:compiler-macro description))))
          (t
           (assert (typep (trucler:compiler-macro description)
                          '(or null function)))))))

(defmacro assert-global-function-description
    (name &rest args &key type inline require-compiler-macro
     &environment environment)
  (declare (ignore type inline require-compiler-macro))
  (apply #'assert-global-function environment name args)
  `(touch #',name))

(defun assert-local-macro (environment name)
  ;; There is no way to ignore a local macro on SBCL; possibly on other
  ;; implementations too.
  (let ((description (trucler:describe-function *client* environment name)))
    (check-type description trucler:local-macro-description)
    (assert (equal (trucler:name description) name))
    (assert (functionp (trucler:expander description)))))

(defmacro assert-local-macro-description (name &environment environment)
  (assert-local-macro environment name)
  `(values))

(defmacro assert-add-local-macro (name &environment environment)
  (flet ((expander (form environment)
           (declare (ignore form environment))
           nil))
    (setf environment (trucler:add-local-macro
                       *client* environment name #'expander)))
  (assert-local-macro environment name))

(defun assert-global-macro (environment name &key require-compiler-macro)
  ;; Inline and notinline declarations should have no effect on macros
  ;; according to CLHS 3.8; on SBCL, globally declaring a name as inline
  ;; causes it to be defined as a function, and locally declaring a
  ;; macro as inline signals an error.
  (let ((description (trucler:describe-function *client* environment name)))
    (check-type description trucler:global-macro-description)
    (assert (equal (trucler:name description) name))
    (assert (functionp (trucler:expander description)))
    (cond (require-compiler-macro
           (assert (functionp (trucler:compiler-macro description))))
          (t
           (assert (typep (trucler:compiler-macro description)
                          '(or null function)))))))

(defmacro assert-global-macro-description
    (name &rest args &key require-compiler-macro &environment environment)
  (declare (ignore require-compiler-macro))
  (apply #'assert-global-macro environment name args)
  `(values))

(defun assert-special-operator (environment name)
  (let ((description (trucler:describe-function *client* environment name)))
    (check-type description trucler:special-operator-description)
    (assert (equal (trucler:name description) name))))

(defmacro assert-special-operator-description (name &environment environment)
  (assert-special-operator environment name)
  `(values))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;
;;; Miscellaneous

(defun assert-block (environment name &optional (identity nil identity-p))
  (let ((description (trucler:describe-block *client* environment name)))
    (check-type description trucler:block-description)
    (assert (eq (trucler:name description) name))
    (when identity-p
      (assert (eq (trucler:identity description) identity)))))

(defmacro assert-block-description (name &environment environment)
  (assert-block environment name)
  `(values))

(defmacro assert-add-block
    (name &optional (identity (gensym)) &environment environment)
  (assert-block (trucler:add-block *client* environment name identity)
                name identity))

(defun assert-tag (environment name &optional (identity nil identity-p))
  (let ((description (trucler:describe-tag *client* environment name)))
    (check-type description trucler:tag-description)
    (assert (eq (trucler:name description) name))
    (when identity-p
      (assert (eq (trucler:identity description) identity)))))

(defmacro assert-tag-description (name &environment environment)
  (assert-tag environment name)
  `(values))

(defmacro assert-add-tag
    (name &optional (identity (gensym)) &environment environment)
  (assert-tag (trucler:add-tag *client* environment name identity)
              name identity))

(defun assert-optimize (environment &key (speed nil speed-p)
                                      (compilation-speed nil compilation-speed-p)
                                      (debug nil debug-p)
                                      (space nil space-p)
                                      (safety nil safety-p))
  (let ((description (trucler:describe-optimize *client* environment)))
    (check-type description trucler:optimize-description)
    (when speed-p
      (assert (= (trucler:speed description) speed)))
    (when compilation-speed-p
      (assert (= (trucler:compilation-speed description) compilation-speed)))
    (when debug-p
      (assert (= (trucler:debug description) debug)))
    (when space-p
      (assert (= (trucler:space description) space)))
    (when safety-p
      (assert (= (trucler:safety description) safety)))))

(defmacro assert-optimize-description
    (&rest args &key speed compilation-speed debug space safety
     &environment environment)
  (declare (ignore speed compilation-speed debug space safety))
  (apply #'assert-optimize environment args)
  `(values))

(defmacro assert-add-optimize
    (&rest args &key (speed nil speed-p)
                  (compilation-speed nil compilation-speed-p)
                  (debug nil debug-p)
                  (space nil space-p)
                  (safety nil safety-p)
     &environment environment)
  (when speed-p
    (setf environment (trucler:add-speed *client* environment speed)))
  (when compilation-speed-p
    (setf environment (trucler:add-compilation-speed
                       *client* environment compilation-speed)))
  (when debug-p
    (setf environment (trucler:add-debug *client* environment debug)))
  (when space-p
    (setf environment (trucler:add-space *client* environment space)))
  (when safety-p
    (setf environment (trucler:add-safety *client* environment safety)))
  (apply #'assert-optimize environment args)
  `(values))
