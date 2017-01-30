bison:
	bison -d programme.y

lex: 
	mv programme.tab.h y.tab.h
	mv programme.tab.c y.tab.c
	flex programme.l

out: lex.yy.c y.tab.c
	gcc -o programme lex.yy.c y.tab.c

clean: 
	rm programme
	rm yy.lex.c
	rm y.tab.c
	rm y.tab.h
