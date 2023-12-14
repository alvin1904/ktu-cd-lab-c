%{
    #include<stdio.h>
    #include<stdlib.h>
    #define YYSTYPE double
    int main();
    int yyerror();
%}
%token NUMBER
%left '+' '-'
%left '*' '/'
%left '(' ')'

%%
stmt: expr{printf("\nResult=%g\n", $1); return 0;};
expr: expr'+'expr {$$=$1+$3;} | 
      expr'-'expr {$$=$1-$3;} |
      expr'*'expr {$$=$1*$3;} |
      expr'/'expr {$$=$1/$3;} |
      '('expr')' {$$=$2;} |
      NUMBER {$$=$1;};
%%

int main(){
    printf("Enter expression: ");
    yyparse();
    return 0;
}

int yyerror(){
    printf("Invalid expression!");
    return 0;
}