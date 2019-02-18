(cl:in-package #:asdf-user)

(defsystem "trucler"
  :depends-on ("acclimation")
  :serial t
  :components
  ((:file "packages")
   (:file "query-functions")
   (:file "query-class-accessors")
   (:file "clone-information")
   (:file "quasi-clone")
   (:file "query-mixin-classes")
   (:file "query-classes")
   (:file "merge-functions")
   (:file "merge-methods")
   (:file "augmentation-functions")
   (:file "environment")
   (:file "query-methods")
   (:file "augmentation-methods")
   (:file "conditions")
   (:file "condition-reporters-english")
   (:file "docstrings-english")))
