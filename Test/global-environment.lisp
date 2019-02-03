(cl:in-package #:trucler-test)

(defclass environment () ())

(defclass trucler-test-client () ())

(defmethod trucler:function-info
    ((client trucler-test-client)
     (environment environment)
     (function-name (eql 'car)))
  (make-instance 'trucler:function-info :name 'car))

(defmethod trucler:variable-info
    ((client trucler-test-client)
     (environment environment)
     (symbol (eql '*standard-output*)))
  (make-instance 'trucler:special-variable-info
    :name '*standard-output*
    :global-p t
    :type 'stream))
