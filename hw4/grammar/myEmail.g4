grammar myEmail;

// email example : mmd123.32_123_@gmail.com.dsa.assd

start
    :
    email EOF
    ;

email
    :
     Alphabets afterthat '@' (Alphabets | digits)+ ('.' Alphabets)+
    ;



afterthat
    :
    (Alphabets | digits | signs+ (Alphabets | digits))*
    ;


Alphabets
    :
    SingleAlphabet+
    ;

digits
    :
    SingleDigit+
    ;


SingleAlphabet
    :
    [A-Za-z]
    ;

SingleDigit
    :
    [0-9]
    ;


signs
    :
    '.'  | '_'
    ;