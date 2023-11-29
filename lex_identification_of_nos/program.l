%option noyywrap

%{
#include<math.h>
FILE *fp;
%}

BIN [0-1]+
OCT [0-7]+
DEC [0-9]+
HEX [0-9A-F]+
FLO [-+]?[0-9]*\.[0-9]+
EXP [-+]?[0-9]+([eE][-+]?[0-9]+)?

%%
{BIN} {printf("Binary: %s", yytext);}
{OCT} {printf("OCTAL: %s", yytext);}
{DEC} {printf("DEC: %s", yytext);}
{HEX} {printf("HEX: %s", yytext);}
{FLO} {printf("FLOAT: %s", yytext);}
{EXP} {printf("EXPONENT: %s", yytext);}
%%

int main(int argc, char *argv[]){
  fp = fopen(argv[1], "r");
  if(fp!=NULL){
      yyin=fp;
      yylex();
  }
  return(0);
}
