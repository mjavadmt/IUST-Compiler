grammar miniJava;

start                :   mainClass classDeclaration* EOF;

IDENTIFIER          :   [a-zA-Z_][0-9a-zA-Z_]*;

mainClass           :   'class' IDENTIFIER '{' 'public' 'static' 'void' 'main' '(' 'String' '[' ']' IDENTIFIER ')' '{' statement '}' '}';
classDeclaration    :   'class' IDENTIFIER ( 'extends' IDENTIFIER )? '{' varDeclaration* methodDeclaration* '}';
methodDeclaration   :   'public' type IDENTIFIER '(' (type IDENTIFIER (',' type IDENTIFIER)*)? ')' '{' varDeclaration* statement* 'return' expression ';' '}';
varDeclaration      :   type IDENTIFIER ';';

type                :    'int'
                    |    'int' '[' ']'
                    |    'boolean'
                    |    IDENTIFIER;

statement           :    '{' statement* '}'
                    |    'if' '(' expression ')' statement 'else' statement
                    |    'while' '(' expression ')' statement
                    |    'System.out.println' '(' expression ')' ';'
                    |    IDENTIFIER '=' expression ';'
                    |    IDENTIFIER '[' expression ']' '=' expression ';';

expression          :    expression '.length'
                    |    expression '[' expression ']'
                    |    expression '.' IDENTIFIER '(' ( expression ( ',' expression )* )? ')'
                    |    expression Signs expression
                    |    'this'
                    |    'new' 'int' '[' expression ']'
                    |    'new' IDENTIFIER '(' ')'
                    |    '!' expression
                    |    '(' expression ')'
                    |    IntegerLiteral
                    |    Boolean
                    |    IDENTIFIER;

Signs               :   '*' | '/' | '+' | '-' | '>' | '<' | '=' | '&&' | '||';
Boolean             :   'true' | 'false';
IntegerLiteral      :   Integer | Decimal;
Integer             :   '0' | [1-9][0-9]*;
Decimal             :   Integer? '.' [0-9]*;
WhiteSpace          :   [ \r\t\n]+ -> skip;
