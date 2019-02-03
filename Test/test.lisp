(cl:in-package #:trucler-test)

(defun test-block ()
  (let* ((global-environment (make-instance 'environment))
         (client (make-instance 'trucler-test-client))
         (e1 (make-instance 'trucler::environment
               :global-environment global-environment))
         (e2 (trucler:add-block client e1 'hello))
         (e3 (trucler:add-block client e2 'hello))
         (b1 (trucler:block-info client e2 'hello))
         (b2 (trucler:block-info client e3 'hello)))
    (assert (not (null b1)))
    (assert (not (null b2)))
    (assert (not (eq b1 b2)))
    (assert (eq (trucler:name b1) 'hello))
    (assert (eq (trucler:name b2) 'hello))))

(defun test ()
  (test-block))
