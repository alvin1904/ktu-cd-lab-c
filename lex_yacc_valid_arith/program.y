%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
int yyerror();
int yylex();
%}

%token NUM ID
%left '+' '-'
%left '*' '/'

%%
e: e '+' e | e '-' e |e '*' e | e '/' e | '('e')' | NUM | ID ;
%%

int main(){
    printf("Type the expression and press the enter key     \n");
    yyparse();  
    printf("Valid Expression\n");
    return 0;
}

int yyerror(){
    printf("Inavlid Expression!\n") ;
    exit(0);    
}