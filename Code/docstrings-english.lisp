(cl:in-package #:trucler)

(setf (documentation 'variable-info 'function)
      (format nil "Return an instance of the class VARIABLE-INFO~@
                   describing the role of SYMBOL in ENVIRONMENT~@
                   when SYMBOL was found in a variable position."))

(setf (documentation 'function-info 'function)
      (format nil "Return an instance of the class FUNCTION-INFO~@
                   describing the role of FUNCTION-NAME in ENVIRONMENT~@
                   when FUNCTION-NAME was found in a function position.~@
                   This function can also be used to obtain information~@
                   about a function name that is not a symbol."))

(setf (documentation 'block-info 'function)
      (format nil "Return an instance of the class BLOCK-INFO~@
                   describing the role of SYMBOL in ENVIRONMENT~@
                   when SYMBOL was found in a position to name a block."))

(setf (documentation 'tag-info 'function)
      (format nil "Return an instance of the class TAG-INFO~@
                   describing the role of TAG in ENVIRONMENT~@
                   when TAG was found in a position to name a~@
                   TAGBODY tag, i.e. as an argument to GO.~@
                   TAG must be a symbol or an integer."))

(setf (documentation 'optimize-info 'function)
      (format nil "Return an instance of the class OPTIMIZE-INFO~@
                   describing the values of all OPTIMIZE qualities~@
                   in ENVIRONMENT."))

(setf (documentation 'name 'function)
      (format nil "This function can be used on any instance returned~@
                   by a query function.  It returns the name of the entity~@
                   that is described in the instance.~@
                   ~@
                   The name returned by this function might be different~@
                   from the name given to the query function, as a result~@
                   of errors and restarts.  Therefore, client code should~@
                   always use the return value of this function for further~@
                   processing."))

(setf (documentation 'identity 'function)
      (format nil " This function returns some kind of object determining~@
                    the identity of the entity that is described in the~@
                    info instance given as the argument."))
