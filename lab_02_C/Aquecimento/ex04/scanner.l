%option outfile="scanner.c"
%option noyywrap 
%option nounput
%option noinput


%{
#include "parser.h"
%}

%%
[0-9]+      { yylval = atoi(yytext); return NUMBER; }
"+"         { return PLUS; }
"\n"        { return ENTER; }
" "         { }
.         { printf("LEXICAL ERROR: Unknown symbol %s\n", yytext); 
              exit(EXIT_FAILURE); }
