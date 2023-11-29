%option noyywrap

%{
#include<stdio.h>
FILE *fp;
%}

IDE [a-zA-Z][a-zA-Z0-9_]*
PRE #.*
PUN [,\.;]
SLC "//".*\n
MLC "/*".*\n*."*\n"
KEY int|float|break|continue|char|double|void|do|case|long|struct|const|typedef|return|else|goto|while\(.*\)|for\(.*\)|if\(.*\)
STR \".*\"
INT [+-]?([0-9]*)
ARI [+\-*/%]
REL "=="|"!="|">"|"<"|">="|"<="
ASS "="|"+="|"-="|"*="|"/="|"%="

%%
{IDE} {printf("Identifier: %s\n", yytext);}
{PRE} {printf("Preprocessor: %s\n", yytext);}
{PUN} {printf("Punctuators: %s\n",yytext);}
{SLC} {printf("Single comment: %s\n",yytext);}
{MLC} {printf("Multi comment: %s\n",yytext);}
{KEY} {printf("Keywords: %s\n",yytext);}
{STR} {printf("String: %s\n",yytext);}
{INT} {printf("Integer: %s\n",yytext);}
{ARI} {printf("Arithmetic: %s\n",yytext);}
{REL} {printf("Relational: %s\n",yytext);}
{ASS} {printf("Assignment: %s\n",yytext);}
\n {}
\( {printf("Function begin: %s\n", yytext);}
\) {printf("Function end: %s\n", yytext);}
%%

void main(int argc, char *argv[]){
  fp = fopen(argv[1], "r");
  if (fp!=NULL){
      yyin = fp;
      yylex();
    }

  }
