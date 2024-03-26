%{
  #include <stdio.h>
  #include <stdlib.h>

  char* upperCase(char* str) {
	char* result = strdup(str);
	int i=0;
	while(str[i]) {
    	result[i] = str[i] - 32;
    	i++;
	}
	return result;
  }
%}

%option yylineno

%%
\n {}
\{[^\}]*\} { }
\"[^"]*\"	{ printf("%d: %s -> %s\n", yylineno, yytext, "STR_VAL"); }
begin   { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
bool      { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
else      { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
end 	  { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
false 	{ printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
if  	  { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
int 	  { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
program { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
read      { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
real      { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
repeat	{ printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
string	{ printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
then      { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
true      { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
until 	{ printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
var 	  { printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }
write 	{ printf("%d: %s -> %s\n", yylineno, yytext, upperCase(yytext)); }

:=  	  { printf("%d: %s -> %s\n", yylineno, yytext, "ASSIGN"); }
=   	  { printf("%d: %s -> %s\n", yylineno, yytext, "EQ"); }
"<"     { printf("%d: %s -> %s\n", yylineno, yytext, "LT"); }
"+"     { printf("%d: %s -> %s\n", yylineno, yytext, "PLUS"); }
-   	  { printf("%d: %s -> %s\n", yylineno, yytext, "MINUS"); }
"*"     { printf("%d: %s -> %s\n", yylineno, yytext, "TIMES"); }
"/" 	  { printf("%d: %s -> %s\n", yylineno, yytext, "OVER"); }
"(" 	  { printf("%d: %s -> %s\n", yylineno, yytext, "LPAR"); }
")" 	  { printf("%d: %s -> %s\n", yylineno, yytext, "RPAR"); }
;   	  { printf("%d: %s -> %s\n", yylineno, yytext, "SEMI"); }


[0-9]+   	 { printf("%d: %s -> %s\n", yylineno, yytext, "INT_VAL"); }
[0-9]+"."[0-9]+ 	  { printf("%d: %s -> %s\n", yylineno, yytext, "REAL_VAL"); }
abc 	  { printf("%d: %s -> %s\n", yylineno, yytext, "ABC"); }

[a-zA-Z]+   	{ printf("%d: %s -> %s\n", yylineno, yytext, "ID"); }
[ \t]       ;
.         { printf("LEXICAL ERROR (%d): Unknown symbol %c\n", yylineno, yytext[0]); return 0; }
%%


int main() {
  yylex();

  return 0;
}



