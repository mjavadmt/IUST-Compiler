grammar hello_id;

start_grammar:
    hello (identifier | hello)+ EOF
    ;

hello :
    'hello'
    ;

identifier :
    ID+
    ;

ID:
    [a-zA-Z0-9_];