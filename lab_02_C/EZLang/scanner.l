%option outfile="scanner.c"
%option noyywrap
%option nounput
%option noinput
%option yylineno

%{
  #include "parser.h"

  // Primitive error handling.
  void yyerror (char const *s) {
    printf("SYNTAX ERROR (%d): %s\n", yylineno, s);
    exit(EXIT_FAILURE);
  }
%}

%%

"\n"          { }
\{[^\}]*\}    { }
\"[^"]*\"	  { return STR_VAL; }
"begin"       { return BEGIN_; }
"bool"        { return BOOL;}
"else"        { return ELSE;}
"end" 	    { return END;}
"false" 	  { return FALSE;}
"if"  	    { return IF;}
"int" 	    { return INT;}
"program"   { return PROGRAM;}
"read"      { return READ;}
"real"      { return REAL;}
"repeat"	  { return REPEAT;}
"string"	  { return STRING;}
"then"      { return THEN;}
"true"      { return TRUE;}
"until" 	  { return UNTIL;}
"var" 	    { return VAR;}
"write" 	  { return WRITE;}

":="  	  { return ASSIGN;}
"="   	  { return EQ;}
"<"     { return LT;}
"+"     { return PLUS;}
"-"   	  { return MINUS;}
"*"     { return TIMES;}
"/" 	  { return OVER;}
"(" 	  { return LPAR;}
")" 	  { return RPAR;}
";"   	  { return SEMI;}


[0-9]+   	          { return INT_VAL;}
[0-9]+"."[0-9]+ 	  { return REAL_VAL;}

[a-zA-Z]+   	      { return ID;}
[ \t]               { }
.               { printf("LEXICAL ERROR (%d): Unknown symbol %c\n", yylineno, yytext[0]); 
                  exit(EXIT_FAILURE); }

