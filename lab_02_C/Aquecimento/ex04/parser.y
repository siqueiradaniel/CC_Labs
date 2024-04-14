%output "parser.c"
%defines "parser.h"
%define parse.error verbose 
%define parse.lac full

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}
%token NUMBER PLUS ENTER
%%
sol: NUMBER PLUS NUMBER { return $1 + $3; };
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
