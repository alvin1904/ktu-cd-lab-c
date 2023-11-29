lex program.l
gcc lex.yy.c
./a.out input.txt
echo "--------------"
cat input.txt

rm a.out lex.yy.c
