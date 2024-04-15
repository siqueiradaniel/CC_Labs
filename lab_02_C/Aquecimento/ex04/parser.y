%output "parser.c"
%defines "parser.h"
%define parse.error verbose 
%define parse.lac full

%{
#include <stdio.h>
int yylex(void);
void yyerror(char const *s);

int result;
%}

%token NUMBER PLUS ENTER

%%
    line : expr ENTER       { result = $$; };
    expr : expr PLUS expr   { $$ = $1 + $3; }
         | NUMBER           { $$ = $1; }
         ;
%%

int main (void) {
    if (yyparse() == 0) printf("PARSE SUCCESSFUL! Result = %d\n", result);
    else                printf("PARSE FAILED!\n");
    return 0;
}