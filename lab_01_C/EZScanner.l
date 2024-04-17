%option yylineno

%{
  #include <stdio.h>
  #include <stdlib.h>

  char* upperCase(char* str) {
    char* result = strdup(str);
    for(int i=0; str[i]; i++) {
        result[i] = str[i] - 32;
    }
    return result;
  }

  void formattedPrint(char* str) {
	  printf("%d: %s -> %s\n", yylineno, yytext, str); 
  }
%}

%%
\n          {}
\{[^\}]*\}  { }
\"[^"]*\"	  { formattedPrint("STR_VAL"); }
begin       { formattedPrint(upperCase(yytext)); }
bool        { formattedPrint(upperCase(yytext)); }
else        { formattedPrint(upperCase(yytext)); }
end 	      { formattedPrint(upperCase(yytext)); }
false 	    { formattedPrint(upperCase(yytext)); }
if  	      { formattedPrint(upperCase(yytext)); }
int 	      { formattedPrint(upperCase(yytext)); }
program     { formattedPrint(upperCase(yytext)); }
read        { formattedPrint(upperCase(yytext)); }
real        { formattedPrint(upperCase(yytext)); }
repeat	    { formattedPrint(upperCase(yytext)); }
string	    { formattedPrint(upperCase(yytext)); }
then        { formattedPrint(upperCase(yytext)); }
true        { formattedPrint(upperCase(yytext)); }
until 	    { formattedPrint(upperCase(yytext)); }
var 	      { formattedPrint(upperCase(yytext)); }
write 	    { formattedPrint(upperCase(yytext)); }

:=  	      { formattedPrint("ASSIGN"); }
=   	      { formattedPrint("EQ");     }
"<"         { formattedPrint("LT");     }
"+"         { formattedPrint("PLUS");   }
-   	      { formattedPrint("MINUS");  }
"*"         { formattedPrint("TIMES");  }
"/" 	      { formattedPrint("OVER"); }
"(" 	      { formattedPrint("LPAR"); }
")" 	      { formattedPrint("RPAR"); }
;   	      { formattedPrint("SEMI"); }


[0-9]+   	        { formattedPrint("INT_VAL"); }
[0-9]+"."[0-9]+   { formattedPrint("REAL_VAL"); }
abc 	            { formattedPrint("ABC"); }

[a-zA-Z]+   	    { formattedPrint("ID"); }
[ \t]             ;
.                 { printf("LEXICAL ERROR (%d): Unknown symbol %c\n", yylineno, yytext[0]); return 0; }
%%


int main() {
  yylex();

  return 0;
}



