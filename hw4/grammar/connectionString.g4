grammar connectionString;

start :
    (prefix equalSign value semiColon)* EOF
    ;

prefix :
    (Alphabet | space)+
    ;

value :
    (Alphabet | Signs)+
    ;

Signs :
    [(){}.]*
   ;

Alphabet :
    [a-zA-Z0-9]*
    ;

space :
    ' '
    ;

equalSign :
    '='
    ;

semiColon :
    ';'
    ;

