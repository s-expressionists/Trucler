(cl:in-package #:asdf-user)

(defsystem "trucler"
  :depends-on ("acclimation")
  :serial t
  :components
  ((:file "packages")
   (:file "query-functions")
   (:file "query-class-accessors")
   (:file "clone-info")
   (:file "query-classes")
   (:file "augmentation-functions")
   (:file "environment")
   (:file "query-methods")
   (:file "conditions")
   (:file "condition-reporters-english")
   (:file "docstrings-english")))
