%output "parser.c"
%defines "parser.h"
%define parse.error verbose
%define parse.lac full

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}
%token NUMBER PLUS MINUS TIMES DIV LPAR RPAR ENTER
%%
line: expr ENTER ;
expr: expr operation expr | 
      LPAR expr RPAR | 
      NUMBER ;
operation: PLUS | MINUS | TIMES | DIV
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
