grammar q3;

start :
    'hello' identifier EOF
    ;

identifier :
    LetterOrDigit+
    ;

LetterOrDigit:
    [_a-zA-Z0-9];