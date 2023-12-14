bison -d calculator.y
lex calculator.l
gcc calculator.tab.c lex.yy.c -lm
./a.out