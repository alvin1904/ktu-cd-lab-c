Certainly! Let's go through your lex file line by line:

```lex
%option noyywrap
```

This line specifies a flex option. In this case, `%option noyywrap` is used to indicate that you do not want to use the default `yywrap` function. This can help resolve the "undefined reference to `yywrap`" issue because it tells flex not to generate a reference to `yywrap` in the generated code.

```lex
%{
#include <math.h>
FILE *fp;
%}
```

This section is the C code that is included in the generated lexer. Here, you include the `<math.h>` header and declare a `FILE` pointer `fp`. This pointer will be used to open and read the input file.

```lex
BIN [0-1]+
OCT [0-7]+
DEC [0-9]+
HEX [0-9A-F]+
FLO [-+]?[0-9]*\.[0-9]+
EXP [-+]?[0-9]+([eE][-+]?[0-9]+)?
```

These are regular expressions (patterns) defined for various types of numbers:

- `BIN`: Binary numbers (0 or 1).
- `OCT`: Octal numbers (digits 0-7).
- `DEC`: Decimal numbers (digits 0-9).
- `HEX`: Hexadecimal numbers (digits 0-9 and letters A-F).
- `FLO`: Floating-point numbers, including integers and decimals.
- `EXP`: Numbers with exponential notation.

```lex
%%
```

This line separates the rules section from the declarations and regular expressions.

```lex
{BIN} {printf("Binary: %s", yytext);}
{OCT} {printf("OCTAL: %s", yytext);}
{DEC} {printf("DEC: %s", yytext);}
{HEX} {printf("HEX: %s", yytext);}
{FLO} {printf("FLOAT: %s", yytext);}
{EXP} {printf("EXPONENT: %s", yytext);}
```

These are the rules section. For each pattern defined earlier, there's a corresponding action to be taken when a match is found. The action is enclosed in curly braces. For example, if a binary number is matched, it will print "Binary: " followed by the matched text.

```lex
%%
```

This line again separates the rules section from the user code.

```lex
int main(int argc, char *argv[]) {
  fp = fopen(argv[1], "r");
  if (fp != NULL) {
      yyin = fp;
      yylex();
  }
  return 0;
}
```

This is the main C code. It opens the file specified as a command-line argument, sets `yyin` to the file pointer, and then calls `yylex()` to start the lexer. Finally, it returns 0.

Overall, your lexer seems to be parsing different types of numbers and printing their categories. The `%option noyywrap` is used to avoid the undefined reference to `yywrap` issue.
