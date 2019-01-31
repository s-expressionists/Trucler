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
