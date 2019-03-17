(in-package #:common-lisp-user)

(defpackage #:trucler-native-sbcl
  (:use #:common-lisp)
  (:import-from #:trucler-native #:native-client)
  (:export
   #:native-client
   #:deprecated
   #:always-bound-p))
