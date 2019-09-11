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
     (:file "null-lexical-environment")
     (:file "query-classes")
     (:file "query-methods")))

   (:module "SBCL"
    :if-feature :sbcl
    :components
    ((:file "packages")
     (:file "null-lexical-environment")
     (:file "query-classes")
     (:file "query-methods")
     (:file "augmentation-methods")))))
