c-comment-converter: c-comment-converter.l
	flex c-comment-converter.l
	clang -o c-comment-converter lex.yy.c
	rm lex.yy.c
clean:
	rm c-comment-converter
