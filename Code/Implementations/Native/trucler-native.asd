(cl:in-package #:asdf-user)

(defsystem "trucler-native"
  :depends-on ("trucler-base")
  :in-order-to ((test-op (test-op "trucler-native-test")))
  :serial t
  :components
  ((:file "packages")
   (:file "client")

   (:module "SBCL"
    :components
    ((:file "packages")
     (:file "query-classes")
     (:file "query-methods")
     (:file "low-level-augmentation-methods")
     (:file "augmentation-methods")))))
