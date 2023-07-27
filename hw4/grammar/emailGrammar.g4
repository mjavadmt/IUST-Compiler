grammar emailGrammar;

start
   : email EOF
   ;

email
   :  Alphabet (DigitAlphabet | (ExtraSigns (Alphabet | DigitAlphabet)) | Alphabet )*  '@'  TwoDigit;


Alphabet
   : [a-zA-Z]+
   ;

DigitAlphabet
    : [0-9]*
    ;

ExtraSigns
    :
     ('.' | '_')*
    ;

TwoDigit
    :
    [a-zA-Z]{2}
    ;