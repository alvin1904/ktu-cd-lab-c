%option noyywrap
%{
    #include<stdio.h>
    #include<stdlib.h>
    #define YYSTYPE double
    #include "calculator.tab.h"
%}

%%
([1-9][0-9]+|[0-9])?(\.[0-9]+)? {yylval=atof(yytext); return NUMBER;}
\n {return 0;}
[\t];
. {return yytext[0];}
%%