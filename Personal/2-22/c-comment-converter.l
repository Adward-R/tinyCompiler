%{
#include <stdio.h>
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif
%}
%%
"//"    {
            char c;
            ECHO;
            while ((c=input())!='\n') putchar(toupper(c));
            putchar('\n');
        }
"/*"    {
            char c;
            int done = FALSE;
            ECHO;
            do{
                while ((c=input())!='*') putchar(toupper(c));
                putchar(toupper(c));
                while ((c=input())=='*') putchar('*');
                putchar(toupper(c));
                if (c=='/') done = TRUE;
            } while (!done);
        }
%%
void main(void) {
	yylex();
}
int yywrap(){
    return 1;
}
