grammar testCount;

start :
    Mycount EOF
    ;

Mycount :
    [0-9]{5}
    ;