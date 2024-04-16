%output "parser.c"
%defines "parser.h"
%define parse.error verbose
%define parse.lac full

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}

%token IF ELSE LPAR RPAR EXP OTHER ENTER
%precedence RPAR 
%precedence ELSE 
     
%%
line : /* empty */ 
     | stmt ENTER line
     ;

stmt : if-stmt 
     | OTHER 
     ;

if-stmt : IF LPAR EXP RPAR stmt 
        | IF LPAR EXP RPAR stmt ELSE stmt 
        ;
%%

int main (void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}