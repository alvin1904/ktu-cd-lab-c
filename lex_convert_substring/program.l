%option noyywrap

%{
#include<stdio.h>
%}

%%
"abc" {strcpy(yytext,"ABC");ECHO;}
%%

void main(){
  yylex();
}
