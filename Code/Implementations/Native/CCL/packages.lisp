(cl:in-package #:common-lisp-user)

(defpackage #:trucler-native-ccl
  (:use #:common-lisp)
  (:import-from #:trucler-native #:client)
  (:export #:client))
