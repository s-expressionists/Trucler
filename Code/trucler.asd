(cl:in-package #:asdf-user)

(defsystem "trucler"
  :depends-on ("acclimation")
  :serial t
  :components
  ((:file "packages")
   (:file "query-functions")
   (:file "query-class-accessors")
   (:file "query-classes")
   (:file "conditions")
   (:file "condition-reporters-english")
   (:file "docstrings-english")))
