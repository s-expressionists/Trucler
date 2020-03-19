(cl:in-package #:asdf-user)

(defsystem "trucler"
  :description "Library for managing lexical environments."
  :author "Robert Strandh <robert.strandh@gmail.com>"
  :license "FreeBSD, see file LICENSE.text"
  :depends-on ("trucler-base" "trucler-native")
  :in-order-to ((test-op (test-op "trucler-native-test"))))
