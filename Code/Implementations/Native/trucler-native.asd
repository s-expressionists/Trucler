(cl:in-package #:asdf-user)

(defsystem "trucler-native"
  :depends-on ("trucler-base")
  :in-order-to ((test-op (test-op "trucler-native-test")))
  :serial t
  :components
  ((:file "packages")
   (:file "client")
   (:file "methods")

   (:module "CCL"
    :if-feature :ccl
    :components
    ((:file "packages")
     (:file "utilities")
     (:file "query-classes")
     (:file "describe-block")
     (:file "describe-function")
     (:file "describe-optimize")
     (:file "describe-declarations")
     (:file "describe-tag")
     (:file "describe-variable")
     (:file "global-environment")
     (:file "global-environment-p")))

   (:module "SBCL"
    :if-feature :sbcl
    :components
    ((:file "packages")
     (:file "utilities")
     (:file "query-classes")
     (:file "describe-block")
     (:file "describe-function")
     (:file "describe-optimize")
     (:file "describe-declarations")
     (:file "describe-tag")
     (:file "describe-variable")
     (:file "low-level-augmentation-utilities")
     (:file "augmentation-methods")
     (:file "global-environment")
     (:file "global-environment-p")))))
