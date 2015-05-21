%{
#include <stdio.h>
#include <ctype.h>
#define YYDEBUG 1
struct num{
	int intValue;
	double doubleValue;
	int isInt;/* isInt=1 intValue isInt=0 doubleValue*/
};
#define YYSTYPE struct num
//int isInt=1;
%}


%token NUMBER

%%
command : exp {
                if ($1.isInt)
                    printf("%d\n", $1.intValue);
				else
                    printf("%lf\n", $1.doubleValue);
        }
        ; /* allows printing of result*/

exp : exp '+' term {
                    if ($1.isInt && $3.isInt) {
                        $$.isInt = 1;
                        $$.intValue = $1.intValue + $3.intValue;
                    }
                    else if (!$1.isInt && $3.isInt) {
                        $$.isInt = 0;
                        $$.doubleValue = $1.doubleValue + $3.intValue * 1.0;
                    }
                    else if ($1.isInt && !$3.isInt) {
                        $$.isInt = 0;
                        $$.doubleValue = $3.doubleValue + $1.intValue * 1.0;
                    }
                    else {
                        $$.isInt = 0;
                        $$.doubleValue = $1.doubleValue + $3.doubleValue;
                    }
        }
    | exp '-' term {
                    if ($1.isInt && $3.isInt) {
                        $$.isInt = 1;
                        $$.intValue = $1.intValue - $3.intValue;
                    }
                    else if (!$1.isInt && $3.isInt) {
                        $$.isInt = 0;
                        $$.doubleValue = $1.doubleValue - $3.intValue * 1.0;
                    }
                    else if ($1.isInt && !$3.isInt) {
                        $$.isInt = 0;
                        $$.doubleValue = $3.doubleValue - $1.intValue * 1.0;
                    }
                    else {
                        $$.isInt = 0;
                        $$.doubleValue = $1.doubleValue - $3.doubleValue;
                    }
        }
	| term { $$ = $1; }
	;

term : term '*' factor {
                        if ($1.isInt && $3.isInt) {
                            $$.isInt = 1;
                            $$.intValue = $1.intValue * $3.intValue;
                        }
                        else if (!$1.isInt && $3.isInt) {
                            $$.isInt = 0;
                            $$.doubleValue = $1.doubleValue * $3.intValue * 1.0;
                        }
                        else if ($1.isInt && !$3.isInt) {
                            $$.isInt = 0;
                            $$.doubleValue = $3.doubleValue * $1.intValue * 1.0;
                        }
                        else {
                            $$.isInt = 0;
                            $$.doubleValue = $1.doubleValue * $3.doubleValue;
                        }
        }
    | factor { $$ = $1; }
    ;

factor : NUMBER { $$ = $1;}
	   | '(' exp ')' {$$ = $2;} //$2 ?
        ;

%%

main(){
    //extern int yydebug;
    //yydebug = 1;
	return yyparse();
}

int yylex(void){
	int c;
    int next_c;
	//printf("%c\n",c);
    while ((c=getchar())==' ');
	//printf("isInt=%d\n",isInt);
	/*elimates blanks*/
    if (isdigit(c)) {
        ungetc(c, stdin);
        yylval.isInt = 1;
        scanf("%d", &(yylval.intValue));
        next_c = getchar();
        if (next_c=='.') {
            ungetc(next_c, stdin);
            scanf("%lf", &(yylval.doubleValue));
            yylval.doubleValue += yylval.intValue;
            yylval.isInt = 0;
        }
        else {
            ungetc(next_c, stdin);
        }
        return(NUMBER);
    }
    /*
	if( c=='.' ){
		isInt=0;
		ungetc(c,stdin);
	}
	else if( isdigit(c) ){
		ungetc(c,stdin);
		yylval.isInt=isInt;
		if(isInt==1){
			scanf("%d",&(yylval.intValue));
			printf("%d\n",yylval.intValue);
		}
		else if(isInt==0){
			scanf("%lf",&(yylval.doubleValue));
			printf("%lf\n",yylval.doubleValue);
		}
		return(NUMBER);
	}
     */
	if(c =='\n') return 0;
	/* makes the parse stop*/
	return(c);
}

int yyerror(char *s){
	fprintf(stderr,"%s\n",s);
	return 0;
}/* allows for printing of an error message*/
