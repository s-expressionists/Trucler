(cl:in-package #:trucler)

(defclass info () ())

(defclass name-mixin ()
  ((%name :initarg :name :reader name)))

(defclass identity-mixin ()
  ((%identity :initarg :identity :reader identity)))

(defclass type-mixin ()
  ((%type :initform t :initarg :type :reader type)))

(defclass ignore-mixin ()
  ((%ignore :initform nil :initarg :ignore :reader ignore)))

(defclass dynamic-extent-mixin ()
  ((%dynamic-extent :initform nil
                    :initarg :dynamic-extent
                    :reader dynamic-extent)))

(defclass variable-info (name-mixin type-mixin) ())

(defclass lexical-variable-info
    (variable-info identity-mixin type-mixin ignore-mixin dynamic-extent-mixin)
  ())

(defclass special-variable-info (variable-info type-mixin ignore-mixin)
  ((%global-p :initform nil :initarg :global-p :reader global-p)))
  
(defclass constant-variable-info (variable-info name-mixin)
  ((%value :initarg :value :reader value)))

(defclass symbol-macro-info (variable-info name-mixin type-mixin)
  ((%expansion :initarg :expansion :reader expansion)))
