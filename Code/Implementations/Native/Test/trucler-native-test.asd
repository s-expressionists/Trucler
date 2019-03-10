(cl:in-package #:asdf-user)

(defsystem :trucler-native-test
  :depends-on ("trucler-base"
               "trucler-native")
  :serial t
  :components
  ((:file "packages")
   (:file "lexical-assertions")
   (:file "tests")))
