%option noyywrap

%{
  #include<stdio.h>
  int chars=0, words=0, lines=0;
%}

CHA [a-zA-Z]+
DOT .
EOL \n

%%
{CHA} {chars+=strlen(yytext); words++;}
{EOL} {chars++; lines++;}
{DOT} {chars++;}
%%

void main(int argc, char *argv[]){
    FILE *fp;
    fp = fopen(argv[1], "r");
    if(fp!=NULL){
      yyin=fp;
      yylex();
      printf("LINES: %d\n", lines);
      printf("WORDS: %d\n", words);
      printf("CHARS: %d\n", chars);
    }
  }

