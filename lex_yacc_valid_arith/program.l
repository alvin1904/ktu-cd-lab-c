%{
#include "program.tab.h"
int yyerror();
%}

%%
[0-9]+(\.[0-9]+)?    { return NUM; }
[a-zA-Z_][_a-zA-Z0-9]* { return ID; }
[-+*/()]             { return yytext[0]; }
\n                   { return 0; }
.                    { yyerror(); }
%%

int yywrap()
{
return 1;
}