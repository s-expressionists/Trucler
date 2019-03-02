(cl:in-package #:asdf-user)

(defsystem "trucler-native"
  :depends-on ("trucler-base")
  :serial t
  :components
  ((:file "low-level-augmentation-methods")
   (:file "augmentation-methods")))
