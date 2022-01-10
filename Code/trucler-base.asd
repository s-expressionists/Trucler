(cl:in-package #:asdf-user)

(defsystem "trucler-base"
  :description "Library for managing lexical environments."
  :author "Robert Strandh <robert.strandh@gmail.com>"
  :license "FreeBSD, see file LICENSE.text"
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
   (:file "query-factories")
   (:file "merge-functions")
   (:file "merge-methods")
   (:file "low-level-augmentation-functions")
   (:file "augmentation-functions")
   (:file "environment-builder")
   (:file "macro-functions")
   (:file "conditions")
   (:file "condition-reporters-english")
   (:file "docstrings-english")))
