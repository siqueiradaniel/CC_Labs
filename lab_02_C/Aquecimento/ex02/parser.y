%output "parser.c"
%defines "parser.h"
%define parse.error verbose
%define parse.lac full

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);
%}

%token NUMBER PLUS MINUS TIMES DIV POW LPAR RPAR ENTER
%left PLUS MINUS                       // Associativa a esquerda.
%left TIMES DIV                        // Mais pra baixo, maior PRI.
%precedence UMINUS
%right POW 

%%
line : expr ENTER 
     ;
expr : expr PLUS expr 
     | expr MINUS expr 
     | expr TIMES expr 
     | expr DIV expr 
     | MINUS expr %prec UMINUS
     | expr POW expr 
     | LPAR expr RPAR 
     | NUMBER 
     ;
%%
int main(void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL!\n");
    else                printf("PARSE FAILED!\n");
    return 0;
}
