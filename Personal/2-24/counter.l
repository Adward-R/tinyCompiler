%{
/*
    Input ctrl+d after all input stream is done to send an interrupt and show the result output.
*/
#include <stdio.h>
#include <string.h>
int lineno = 0;
int wordno = 0;
int charno = 0;
%}
letter  [a-zA-Z0-9]
word    {letter}+
line    \n
%%
{line}  {
            lineno++;
            charno++;
        }
{word}  {
            int cnt = 0;
            wordno++;
            for (cnt=0;cnt<strlen(yytext);cnt++) charno++;
        }
.       { charno++; }
%%
void main(void) {
	yylex();
    printf("%d,%d,%d",charno,wordno,lineno);
}
int yywrap(){
    return 1;
}
