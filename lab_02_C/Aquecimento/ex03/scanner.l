%option outfile="scanner.c"
%option noyywrap
%option nounput 
%option noinput 

%{
#include "parser.h"
%}

%%
"if"        { printf("IF\n"); return IF; }
"else"      { printf("ELSE\n"); return ELSE; }
"("        { printf("LPAR\n"); return LPAR; }
")"        { printf("RPAR\n"); return RPAR; }
"other"         { printf("OTHER\n"); return OTHER; }
0|1         { printf("EXP\n"); return EXP; }
" "         { }
"\n"        { printf("Quebra\n"); return ENTER; }
.           { printf("LEXICAL ERROR: unknown symbol: %s", yytext); 
              exit(EXIT_FAILURE); }
