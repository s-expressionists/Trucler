(cl:in-package #:trucler)

;;; This function can be used on any instance returned by a query
;;; function.  It returns the name of the entity that is described in
;;; the instance.  The name returned by this function might be
;;; different from the name given to the query function, as a result
;;; of errors and restarts.  Therefore, client code should always use
;;; the return value of this function for further processing.
(defgeneric name (info-instance))

;;; This function returns some kind of object determining the identity
;;; of the entity that is described in the info instance given as the
;;; argument.
(defgeneric identity (info-instance))
