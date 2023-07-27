grammar urlGrammar;

start
   : uri EOF
   ;

uri
   :  (('http' | 'https') '://') ? 'www.'? urlDomain '.' urlDomain ('.' urlDomain)* (endSlash urlEnd)* '/' ?
   ;

urlDomain
    :
    DigitAlphabet
    ;


urlEnd
    : (DigitAlphabet | ExtraSigns | endDot)+
    ;

DigitAlphabet
    : [a-zA-Z0-9]*
    ;

ExtraSigns
    :
     ('#' | '$' | '%' | '@' | '&' | '=' | '!' | '-' | '?')*
    ;


endDot :
    '.'+
    ;

endSlash
    : '/';

