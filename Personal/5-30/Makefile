simple-counter-parser: simple-counter-parser.y
	yacc simple-counter-parser.y
	clang -o simple-counter-parser y.tab.c
	rm y.tab.c
clean:
	rm simple-counter-parser
