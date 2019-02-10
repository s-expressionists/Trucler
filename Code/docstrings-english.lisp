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
      (format nil "This function returns some kind of object determining~@
                   the identity of the entity that is described in the~@
                   info instance given as the argument."))

(setf (documentation 'type 'function)
      (format nil "This function returns the type of the entity that is~@
                   described in the info instance given as the argument."))

(setf (documentation 'inline 'function)
      (format nil "This function returns information about any INLINE~@
                   declaration in scope for the info instance given as~@
                   the argument.~@
                   ~@
                   There are three possible values here, namely~@
                   NIL, INLINE and NOTINLINE.  NIL means that there is~@
                   neither an INLINE nor a NOTINLINE declaration in scope.~@
                   INLINE means that there is an INLINE declaration in scope,~@
                   and NOTINLINE means that there is a NOTINLINE declaration~@
                   in scope."))

(setf (documentation 'ignore 'function)
      (format nil "This function returns information about any IGNORE~@
                   or IGNORABLE declaration in scope for the info instance~@
                   given as the argument.~@
                   ~@
                   There are three possible values here, namely~@
                   NIL, IGNORE and IGNORABLE.  NIL means that there is~@
                   neither an IGNORE nor a IGNORABLE declaration in scope.~@
                   IGNORE means that there is an IGNORE declaration in scope,~@
                   and IGNORABLE means that there is a IGNORABLE declaration~@
                   in scope.~@
                   ~@
                   The argument must be an instance of a subclass of one of~@
                   the following classes: LOCAL-FUNCTION-INFO, LOCAL-MACRO-INFO,~@
                   LEXICAL-VARIABLE-INFO, or ."))

(setf (documentation 'dynamic-extent 'function)
      (format nil "This function returns TRUE if and only if there is~@
                   a DYNAMIC-EXTENT declaration in scope for the info~@
                   instance given as the argument."))

(setf (documentation 'compler-macro 'function)
      (format nil ""))

(setf (documentation 'expander 'function)
      (format nil ""))

(setf (documentation 'global-p 'function)
      (format nil ""))

(setf (documentation 'value 'function)
      (format nil ""))

(setf (documentation 'expansion 'function)
      (format nil ""))

(setf (documentation 'class-name 'function)
      (format nil ""))

(setf (documentation 'method-class-name 'function)
      (format nil ""))
