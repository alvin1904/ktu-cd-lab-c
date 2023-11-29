lex program.l
gcc lex.yy.c
./a.out input.txt
cat input.txt
rm lex.yy.c a.out
