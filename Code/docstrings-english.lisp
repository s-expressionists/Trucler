(cl:in-package #:trucler)

(setf (documentation 'describe-variable 'function)
      (format nil "Return an instance of the class VARIABLE-DESCRIPTION~@
                   describing the role of NAME in ENVIRONMENT~@
                   when NAME was found in a variable position."))

(setf (documentation 'describe-function 'function)
      (format nil "Return an instance of the class FUNCTION-DESCRIPTION~@
                   describing the role ofNAME in ENVIRONMENT~@
                   when NAME was found in a function position.~@
                   This function can also be used to obtain information~@
                   about a function name that is not a symbol."))

(setf (documentation 'describe-block 'function)
      (format nil "Return an instance of the class BLOCK-DESCRIPTION~@
                   describing the role of NAME in ENVIRONMENT~@
                   when NAME was found in a position to name a block,~@
                   typically in a RETURN-FROM special form."))

(setf (documentation 'describe-tag 'function)
      (format nil "Return an instance of the class TAG-DESCRIPTION~@
                   describing the role of TAG in ENVIRONMENT~@
                   when TAG was found in a position to name a~@
                   TAGBODY tag, i.e. as an argument to GO.~@
                   TAG must be a symbol or an integer."))

(setf (documentation 'describe-optimize 'function)
      (format nil "Return an instance of the class OPTIMIZE-DESCRIPTION~@
                   describing the values of all OPTIMIZE qualities~@
                   in ENVIRONMENT."))

(setf (documentation 'describe-class 'function)
      (format nil "Return an instance of the class CLASS-DESCRIPTION~@
                   describing the role of NAME in ENVIRONMENT~@
                   when NAME was found in a position to name a class,~@
                   typically as a specializer in a DEFMETHOD form, as~@
                   as a superclass name in a DEFCLASS form, or as the~@
                   argument to a :METACLASS option of a DEFCLASS form."))

(setf (documentation 'name 'function)
      (format nil "Return the name of DESCRIPTION, typically given as the~@
                   value of the :NAME initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   NAME-MIXIN.~@
                   ~@
                   The name returned by this function might be different~@
                   from the name given to the query function that returned~@
                   DESCRIPTION, as a result of errors and restarts.~@
                   Therefore, client code should always use the return value~@
                   of this function for further processing."))

(setf (documentation 'identity 'function)
      (format nil "Return the identity of DESCRIPTION, typically given as the~@
                   value of the :IDENTITY initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   IDENTITY-MIXIN."))

(setf (documentation 'type 'function)
      (format nil "Return the type of DESCRIPTION, typically given as the~@
                   value of the :TYPE initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   TYPE-MIXIN.~@
                   ~@
                   The return value is a type descriptor."))

(setf (documentation 'inline 'function)
      (format nil "Return the inline property of DESCRIPTION, typically given as the~@
                   value of the :INLINE initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   INLINE-MIXIN.~@
                   ~@
                   There are three possible values here, namely~@
                   NIL, INLINE and NOTINLINE.  NIL means that there is~@
                   neither an INLINE nor a NOTINLINE declaration in scope.~@
                   INLINE means that there is an INLINE declaration in scope,~@
                   and NOTINLINE means that there is a NOTINLINE declaration~@
                   in scope."))

(setf (documentation 'ignore 'function)
      (format nil "Return the ignore property of DESCRIPTION, typically given as the~@
                   value of the :IGNORE initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   IGNORE-MIXIN.~@
                   ~@
                   There are three possible values here, namely~@
                   NIL, IGNORE and IGNORABLE.  NIL means that there is~@
                   neither an IGNORE nor a IGNORABLE declaration in scope.~@
                   IGNORE means that there is an IGNORE declaration in scope,~@
                   and IGNORABLE means that there is a IGNORABLE declaration~@
                   in scope"))

(setf (documentation 'dynamic-extent 'function)
      (format nil "Return the dynamic-extent property of DESCRIPTION, typically given as the~@
                   value of the :DYNAMIC-EXTENT initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   DYNAMIC-EXTENT-MIXIN.
                   ~@
                   The return value is a generalized Boolean."))

(setf (documentation 'compiler-macro 'function)
      (format nil "Return the compiler-macro property of DESCRIPTION, typically given as the~@
                   value of the :COMPILER-MACRO initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   COMPILER-MACRO-MIXIN.
                   ~@
                   The return value is either a compiler-macro function, which is a~@
                   function with two parameters, namely a FORM and an ENVIRONMENT, or~@
                   NIL if there is no compiler macro associated with the function~@
                   description."))

(setf (documentation 'expander 'function)
      (format nil "Return the expander property of DESCRIPTION, typically given as the~@
                   value of the :EXPANDER initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   EXPANDER-MIXIN.
                   ~@
                   The return value is either a macro function, which is a~@
                   function with two parameters, namely a FORM and an ENVIRONMENT, or~@
                   NIL if there is no expander associated with the function~@
                   description."))

(setf (documentation 'value 'function)
      (format nil "Return the value property of DESCRIPTION, typically given as the~@
                   value of the :VALUE initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   VALUE-MIXIN.
                   ~@
                   The return value is a the value of a constant variable described~@
                   by DESCRIPTION."))

(setf (documentation 'expansion 'function)
      (format nil "Return the expansion property of DESCRIPTION, typically given as the~@
                   expansion of the :EXPANSION initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   EXPANSION-MIXIN.
                   ~@
                   The return value is a a form that is defined to be the expansion~@
                   of a symbol macro described by DESCRIPTION."))

(setf (documentation 'class-name 'function)
      (format nil "Return the class-name property of DESCRIPTION, typically given as the~@
                   value of the :CLASS-NAME initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   CLASS-NAME-MIXIN.
                   ~@
                   The return value is a the the name of the class of the function~@
                   when DESCRIPTION describes a function."))

(setf (documentation 'method-class-name 'function)
      (format nil "Return the method-class-name property of DESCRIPTION, typically given as the~@
                   value of the :METHOD-CLASS-NAME initialization argument when DESCRIPTION~@
                   was created.  DESCRIPTION must be a subclass of the class~@
                   METHOD-CLASS-NAME-MIXIN.
                   ~@
                   The return value is a the the name of the class of the methods of~@
                   a generic function when DESCRIPTION describes a generic function."))

(setf (documentation (find-class 'name-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some named entity, such as a function or a class.
                   ~@
                   The initarg :NAME is supported by this class.  The nature of this~@
                   argument depends on the entity being named.  For a variable, it is~@
                   a symbol.  For a function, it is a symbol or a list (SETF symbol).~@
                   For a tag, it is a symbol or an integer.~@
                   ~@
                   The reader NAME can be used to access the name of the entity."))

(setf (documentation (find-class 'type-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have a type associated with it, such as~@
                   a variable or a function.~@
                   ~@
                   The initarg :TYPE is supported by this class.  The value of this~@
                   initarg is a type descriptor.  If this initarg is not given, it~@
                   defaults to T.~@
                   ~@
                   The reader TYPE can be used to access the type of the entity."))

(setf (documentation (find-class 'ignore-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can be declared IGNORE or IGNORABLE.~@
                   ~@
                   The initarg :IGNORE is supported by this class.  The value of this~@
                   initarg is one of the symbols IGNORE, IGNORABLE, and NIL from the~@
                   COMMON-LISP package~@
                   ~@
                   The reader IGNORE can be used to access the ignore information of~@
                   the entity."))

(setf (documentation (find-class 'dynamic-extent-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can be declared DYNAMIC-EXTENT.~@
                   ~@
                   The initarg :DYNAMIC-EXTENT is supported by this class.  The value~@
                   of this initarg is a generalized Boolean.~@
                   ~@
                   The reader DYNAMIC-EXTENT can be used to access the dynamic-extent~@
                   information of the entity."))

(setf (documentation (find-class 'expansion-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have an expansion, in particular~@
                   symbol macros.~@
                   ~@
                   The initarg :EXPANSION is supported by this class.  The value~@
                   of this initarg is a form.~@
                   ~@
                   The reader EXPANSION can be used to access the expansion~@
                   information of the entity."))

(setf (documentation (find-class 'expander-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have an expander function, in particular~@
                   macros.~@
                   ~@
                   The initarg :EXPANDER is supported by this class.  The value~@
                   of this initarg is a function of two arguments, a form and.~@
                   an environment.~@
                   ~@
                   The reader EXPANDER can be used to access the expander~@
                   information of the entity."))

(setf (documentation (find-class 'inline-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can be declared INLINE or NOTINLINE.~@
                   ~@
                   The initarg :INLINE is supported by this class.  The value of this~@
                   initarg is one of the symbols INLINE and NOTINLINE from the~@
                   COMMON-LISP package~@
                   ~@
                   The reader INLINE can be used to access the inline information of~@
                   the entity."))

(setf (documentation (find-class 'inline-data-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can be declared INLINE or NOTINLINE, and that~@
                   may contain additional data for inlining.~@
                   ~@
                   The initarg :INLINE-DATA is supported by this class.  The value~@
                   of this initarg can be any datum supplied by client code.  The~@
                   default value if this intarg is not supplied is NIL.~@
                   ~@
                   The reader INLINE-DATA can be used to access the inline information~@
                   of the entity."))

(setf (documentation (find-class 'class-name-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have an class-name, in particular~@
                   ordinary or generic functions.~@
                   ~@
                   The initarg :CLASS-NAME is supported by this class.  The value~@
                   of this initarg is a symbol.~@
                   ~@
                   The reader CLASS-NAME can be used to access the class-name~@
                   information of the entity."))

(setf (documentation (find-class 'method-class-name-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have a method-class-name, in particular~@
                   generic functions.~@
                   ~@
                   The initarg :METHOD-CLASS-NAME is supported by this class.  The value~@
                   of this initarg is a symbol.~@
                   ~@
                   The reader METHOD-CLASS-NAME can be used to access the method-class-name~@
                   information of the entity."))

(setf (documentation (find-class 'metaclass-name-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have a metaclass-name, in particular~@
                   classes.~@
                   ~@
                   The initarg :METACLASS-NAME is supported by this class.  The value~@
                   of this initarg is a symbol.~@
                   ~@
                   The reader METACLASS-NAME can be used to access the metaclass-name~@
                   information of the entity."))

(setf (documentation (find-class 'superclass-names-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have a list of superclass-names, in particular~@
                   classes.~@
                   ~@
                   The initarg :SUPERCLASS-NAMES is supported by this class.  The value~@
                   of this initarg is a list of symbols.~@
                   ~@
                   The reader SUPERCLASS-NAMES can be used to access the superclass-names~@
                   information of the entity."))

(setf (documentation (find-class 'speed-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have speed information, in particular~@
                   the class optimize-description.~@
                   ~@
                   The initarg :SPEED is supported by this class.  The value~@
                   of this initarg is an integer between 0 and 3.~@
                   ~@
                   The reader SPEED can be used to access the speed~@
                   information of the entity."))

(setf (documentation (find-class 'compilation-speed-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have compilation-speed information, in particular~@
                   the class optimize-description.~@
                   ~@
                   The initarg :COMPILATION-SPEED is supported by this class.  The value~@
                   of this initarg is an integer between 0 and 3.~@
                   ~@
                   The reader COMPILATION-SPEED can be used to access the compilation-speed~@
                   information of the entity."))

(setf (documentation (find-class 'debug-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have debug information, in particular~@
                   the class optimize-description.~@
                   ~@
                   The initarg :DEBUG is supported by this class.  The value~@
                   of this initarg is an integer between 0 and 3.~@
                   ~@
                   The reader DEBUG can be used to access the debug~@
                   information of the entity."))

(setf (documentation (find-class 'space-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have space information, in particular~@
                   the class optimize-description.~@
                   ~@
                   The initarg :SPACE is supported by this class.  The value~@
                   of this initarg is an integer between 0 and 3.~@
                   ~@
                   The reader SPACE can be used to access the space~@
                   information of the entity."))

(setf (documentation (find-class 'safety-mixin) 't)
      (format nil "This mixin class supplies a single initarg and a single reader.~@
                   It can be used as a superclass of query classes that correspond~@
                   to some entity that can have safety information, in particular~@
                   the class optimize-description.~@
                   ~@
                   The initarg :SAFETY is supported by this class.  The value~@
                   of this initarg is an integer between 0 and 3.~@
                   ~@
                   The reader SAFETY can be used to access the safety~@
                   information of the entity."))

(setf (documentation (find-class 'variable-description) 't)
      (format nil "This abstract class is the superclass of every query class~@
                   returned by a call to the generic function DESCRIBE-VARIABLE.~@
                   It is a subclass of the class NAME-MIXIN and IGNORE-MIXIN."))

(setf (documentation (find-class 'authentic-variable-description) 't)
      (format nil "This abstract class is a subclass of the classes VARIABLE-DESCRIPTION,~@
                   TYPE-MIXIN, and DYNAMIC-EXTENT-MIXIN."))

(setf (documentation (find-class 'special-variable-description) 't)
      (format nil "This abstract class is a superclass of the classes~@
                   LOCAL-SPECIAL-VARIABLE-DESCRIPTION and GLOBAL-SPECIAL-VARIABLE-DESCRIPTION."))

(setf (documentation (find-class 'symbol-macro-description) 't)
      (format nil "This abstract class is a subclass of the classes VARIABLE-DESCRIPTION,~@
                   TYPE-MIXIN, and EXPANSION-MIXIN."))

(setf (documentation (find-class 'function-description) 't)
      (format nil "This abstract class is the superclass of every query class~@
                   returned by a call to the generic function DESCRIBE-FUNCTION.~@
                   It is a subclass of the class NAME-MIXIN."))

(setf (documentation (find-class 'authentic-function-description) 't)
      (format nil "This abstract class is a subclass of the classes FUNCTION-DESCRIPTION~@
                   and TYPE-MIXIN."))

(setf (documentation (find-class 'macro-description) 't)
      (format nil "This abstract class is a subclass of the classes FUNCTION-DESCRIPTION~@
                   and EXPANDER-MIXIN."))

(setf (documentation (find-class 'lexical-variable-description) 't)
      (format nil "This instantiable class represents information about lexical~@
                   variables.  An instance of this class is returned by a call to~@
                   variable-description when it turns out that the symbol passed~@
                   as an argument refers to a lexical variable.~@
                   ~@
                   This class is a subclass of the classes AUTHENTIC-VARIABLE-DESCRIPTION~@
                   and IDENTITY-MIXIN."))

(setf (documentation (find-class 'local-special-variable-description) 't)
      (format nil "This instantiable class represents information about special~@
                   variables.  An instance of this class is returned by a call to~@
                   variable-description when it turns out that the symbol passed~@
                   as an argument refers to a local special variable.~@
                   ~@
                   This class is a subclass of the class SPECIAL-VARIABLE-DESCRIPTION."))

(setf (documentation (find-class 'global-special-variable-description) 't)
      (format nil "This instantiable class represents information about special~@
                   variables.  An instance of this class is returned by a call to~@
                   variable-description when it turns out that the symbol passed~@
                   as an argument refers to a global special variable.~@
                   ~@
                   This class is a subclass of the class SPECIAL-VARIABLE-DESCRIPTION."))

(setf (documentation (find-class 'constant-variable-description) 't)
      (format nil "This instantiable class represents information about constant~@
                   variables.  An instance of this class is returned by a call to~@
                   variable-description when it turns out that the symbol passed~@
                   as an argument refers to a constant variable.~@
                   ~@
                   This class is a subclass of the classes VARIABLE-DESCRIPTION~@
                   and VALUE-MIXIN."))

(setf (documentation (find-class 'global-symbol-macro-description) 't)
      (format nil "This instantiable class represents information about global~@
                   symbol macros.  An instance of this class is returned by a call to~@
                   variable-description when it turns out that the symbol passed~@
                   as an argument refers to a global symbol macro.~@
                   ~@
                   This class is a subclass of the class SYMBOL-MACRO-DESCRIPTION."))

(setf (documentation (find-class 'local-symbol-macro-description) 't)
      (format nil "This instantiable class represents information about local~@
                   symbol macros.  An instance of this class is returned by a call to~@
                   variable-description when it turns out that the symbol passed~@
                   as an argument refers to a local symbol macro.~@
                   ~@
                   This class is a subclass of the class SYMBOL-MACRO-DESCRIPTION."))

(setf (documentation (find-class 'local-function-description) 't)
      (format nil "This instantiable class represents information about local~@
                   functions introduced by FLET or LABELS.  An instance of this class~@
                   is returned by a call to function-description when it turns out that~@
                   the name passed as an argument refers to a local function.~@
                   ~@
                   This class is a subclass of the classes AUTHENTIC-FUNCTION-DESCRIPTION,~@
                   IDENTITY-MIXIN, IGNORE-MIXIN, and DYNAMIC-EXTENT-MIXIN."))

(setf (documentation (find-class 'global-function-description) 't)
      (format nil "This instantiable class represents information about global~@
                   functions.  An instance of this class is returned by a call to~@
                   function-description when it turns out that the name passed~@
                   as an argument refers to a global function.~@
                   ~@
                   This class is a subclass of the classes AUTHENTIC-FUNCTION-DESCRIPTION,~@
                   COMPILER-MACRO-MIXIN, and CLASS-NAME-MIXIN."))

(setf (documentation (find-class 'generic-function-description) 't)
      (format nil "This instantiable class represents information about generic~@
                   functions.  An instance of this class is returned by a call to~@
                   function-description when it turns out that the name passed~@
                   as an argument refers to a generic function.~@
                   ~@
                   This class is a subclass of the classes GLOBAL-FUNCTION-DESCRIPTION,~@
                   and METHOD-CLASS-NAME-MIXIN."))

(setf (documentation (find-class 'local-macro-description) 't)
      (format nil "This instantiable class represents information about local~@
                   macros introduced by MACROLET.  An instance of this class~@
                   is returned by a call to function-description when it turns out that~@
                   the name passed as an argument refers to a local macro.~@
                   ~@
                   This class is a subclass of the classes MACRO-DESCRIPTION, and~@
                   IGNORE-MIXIN."))

(setf (documentation (find-class 'global-macro-description) 't)
      (format nil "This instantiable class represents information about global~@
                   macros.  An instance of this class is returned by a call to~@
                   function-description when it turns out that the name passed~@
                   as an argument refers to a global macro.~@
                   ~@
                   This class is a subclass of the classes MACRO-DESCRIPTION and~@
                   COMPILER-MACRO-MIXIN."))
