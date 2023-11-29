A lex file typically consists of several sections, each serving a specific purpose. Here are the common parts found in a lex file:

1. **Options Section: `%option ...`**

   - The `%option` directive is used to specify various options for the lexer. For example, `%option noyywrap` disables the default `yywrap` function.

   Example:

   ```lex
   %option noyywrap
   ```

2. **Definitions Section: `%{ ... %}`**

   - The `%{ ... %}` section allows you to include C code directly in your lex file. This code is copied verbatim into the generated lexer. It is commonly used for including header files, defining global variables, and performing other initialization tasks.

   Example:

   ```lex
   %{
   #include <stdio.h>
   int token_count = 0;
   %}
   ```

3. **Definitions Section: `NAME REGEXP`**

   - This section defines macros for regular expressions. These macros are used in the rules section to match patterns in the input.

   Example:

   ```lex
   DIGIT [0-9]
   LETTER [a-zA-Z]
   ```

4. **Rules Section: `%% ... %%`**

   - The rules section contains a list of rules that define patterns and associated actions. Each rule has the form `PATTERN ACTION`, where the pattern is a regular expression, and the action is C code to be executed when the pattern is matched.

   Example:

   ```lex
   %%
   {DIGIT}+   { printf("Found a number: %s\n", yytext); }
   {LETTER}+  { printf("Found a word: %s\n", yytext); }
   ```

5. **User Code Section: `...`**

   - The user code section contains additional C code that is copied verbatim into the generated lexer. This section is typically placed after the rules section.

   Example:

   ```lex
   %%
   int main() {
       yylex();
       return 0;
   }
   ```

These sections collectively define the behavior of the lexer. Understanding how to structure and use these sections is crucial for creating effective lexers for different types of input. Additionally, it's essential to have a good understanding of regular expressions and how they are used in the context of lexing.
