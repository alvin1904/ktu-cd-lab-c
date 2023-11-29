bison program.y -d
lex program.l
# gcc lex.yy.c program.tab.c -o program
gcc -o program lex.yy.c program.tab.c -lfl -ly
./program
