(cl:in-package #:asdf-user)

(defsystem "trucler-native"
  :depends-on ("trucler-base")
  :in-order-to ((test-op (test-op "trucler-native-test")))
  :serial t
  :components
  ((:file "packages")
   (:file "client")
   (:file "query-classes-sbcl" :if-feature :sbcl)
   (:file "query-methods-sbcl" :if-feature :sbcl)
   (:file "low-level-augmentation-methods-sbcl" :if-feature :sbcl)
   (:file "augmentation-methods-sbcl" :if-feature :sbcl)))
