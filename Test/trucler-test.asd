(cl:in-package #:asdf-user)

(defsystem "trucler-test"
  :depends-on ("trucler")
  :serial t
  :components
  ((:file "packages")
   (:file "test")))

