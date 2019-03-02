(cl:in-package #:asdf-user)

(defsystem "trucler-base"
  :depends-on ("acclimation")
  :serial t
  :components
  ((:file "packages")
   (:file "query-functions")
   (:file "query-class-accessors")
   (:file "cloning-information")
   (:file "quasi-clone")
   (:file "query-mixin-classes")
   (:file "query-classes")
   (:file "merge-functions")
   (:file "merge-methods")
   (:file "low-level-augmentation-functions")
   (:file "augmentation-functions")
   (:file "conditions")
   (:file "condition-reporters-english")
   (:file "docstrings-english")))
