(in-package #:common-lisp-user)

(defpackage #:trucler-native-sbcl
  (:use #:common-lisp)
  (:import-from #:trucler-native #:client)
  (:export
   #:client
   #:deprecated
   #:always-bound-p))
