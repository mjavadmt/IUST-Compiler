grammar trainUrl;

start :
    url EOF
    ;

url :
    prefixUrl Alphabets (Digits | Alphabets | signs)* ('.' Alphabets (Digits | Alphabets)*)+ query?
    ;

prefixUrl :
    ('http' 's'? '://' 'www.')? | 'www.'
    ;

query :
    '?' Alphabets (Digits | Alphabets)* '=' (extraSigns | Alphabets | Digits)+ '&'
    ;

Alphabets
    :
    [A-Za-z]+
    ;

Digits
    :
    [0-9]+
    ;


signs
    :
    ('-'  | '_')+
    ;

extraSigns
    :
     ('#' | '$' | '%' | '@' | '!' | '-' | '?')+
    ;
