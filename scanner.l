%{
	#include <stdio.h>
	int line_no=1;
%}
A [aA]
B [bB]
C [cC]
D [dD]
E [eE]
F [fF]
G [gG]
H [hH]
I [iI]
J [jJ]
K [kK] 
L [lL]
M [mM]
N [nN]
O [oO]
P [pP]
Q [qQ]
R [rR]
S [sS]
T [tT]
U [uU]
V [vV]
W [wW]
X [xX]
Y [yY] 
Z [zZ]
NOQUOTE [^']

%%
{A}{B}{S}{O}{L}{U}{T}{E} return(ABSOLUTE);
{A}{B}{S}{T}{R}{A}{C}{T} return(ABSTRACT);
{A}{N}{D} return(AND);
{A}{R}{R}{A}{Y} return(ARRAY);
{A}{S} return(AS);
{A}{S}{M} return(ASM);
{A}{S}{S}{E}{M}{B}{L}{E}{R} return(ASSEMBLER);
{A}{T} return(AT);
{A}{U}{T}{O}{M}{A}{T}{E}{D} return(AUTOMATED);
{B}{E}{G}{I}{N} return(BEGIN);
{C}{A}{S}{E} return(CASE);
{C}{D}{E}{C}{L} return(CDECL);
{C}{L}{A}{S}{S} return(CLASS);
{C}{O}{N}{S}{T} return(CONST);
{C}{O}{N}{S}{T}{R}{U}{C}{T}{O}{R} return(CONSTRUCTOR);
{C}{O}{N}{T}{A}{I}{N}{S} return(CONTAINS);
{D}{E}{F}{A}{U}{L}{T} return(DEFAULT);
{D}{E}{S}{T}{R}{U}{C}{T}{O}{R} return(DESTRUCTOR);
{D}{I}{S}{P}{I}{D} return(DISPID);
{D}{I}{S}{P}{I}{N}{T}{E}{R}{F}{A}{C}{E} return(DISPINTERFACE);
{D}{I}{V} return(DIV);
{D}{O} return(DO);
{D}{O}{W}{N}{T}{O} return(DOWNTO);
{D}{Y}{N}{A}{M}{I}{C} return(DINAMIC);
{E}{L}{S}{E} return(ELSE);
{E}{N}{D} return(END);
{E}{X}{C}{E}{P}{T} return(EXCEPT);
{E}{X}{P}{O}{R}{T} return(EXPORT)
{E}{X}{P}{O}{R}{T}{S} return(EXPORTS);
{E}{X}{T}{E}{R}{N}{A}{L} return(EXTERNAL);
{F}{A}{R} return(FAR);
{F}{I}{L}{E} return(FILE);
{F}{I}{N}{A}{L}{I}{Z}{A}{T}{I}{O}{N} return(FINALIZATION);
{F}{I}{N}{A}{L}{L}{Y} return(FINALLY);
{F}{O}{R} return(FOR);
{F}{O}{W}{A}{R}{D} return(FORWARD);
{F}{U}{N}{C}{T}{I}{O}{N} return(FUNCTION);
{G}{O}{T}{O} return(GOTO);
{I}{F} return(IF);
{I}{M}{P}{L}{E}{M}{E}{N}{T}{A}{T}{I}{O}{N} return(IMPLEMENTATION);
{I}{M}{P}{L}{E}{M}{E}{N}{T}{S} return(IMPLEMENTS);
{I}{N} return(IN);
{I}{N}{D}{E}{X} return(INDEX);
{I}{N}{H}{E}{R}{I}{T}{E}{D} return(INHERETIED);
{I}{N}{I}{T}{I}[A]{L}{I}{Z}{A}{T}{I}{O}{N} return(IINITIALIZATION);
{I}{N}{L}{I}{N}{E} return(INLINE);
{I}{N}{T}{E}{R}{F}{A}{C}{E} return(INTERFACE);
{I}{S} return(IS);
{L}{A}{B}{E}{L} return(LABEL);
{L}{I}{B}{R}{A}{R}{Y} return(LIBRARY);
{M}{E}{S}{S}{A}{G}{E} return(MESSAGE);
{M}{O}{D} return(MOD);
{N}{A}{M}{E} return(NAME);
{N}{E}{A}{R} return(NEAR);
{N}{I}{L} return(NIL);
{N}{O}{D}{E}{F}{A}{U}{L}{T} return(NODEFAULT);
{N}{O}{T} return(NOT);
{O}{B}{J}{E}{C}{T} return(OBJECT);
{O}{F} return(OF);
{O}{N} return(ON);
{O}{R} return(OR);
{O}{U}{T} return(OUT);
{O}{V}{E}{R}{L}{O}{A}{D} return(OVERLOAD);
{O}{V}{E}{R}{R}{I}{D}{E} return(OVERRIDE);
{P}{A}{C}{K}{A}{G}{E} return(PACKAGE);
{P}{A}{C}{K}{E}{D} return(PACKED);
{P}{A}{S}{C}{A}{L} return(PASCAL);
{P}{R}{I}{V}{A}{T}{E} return(PRIVATE);
{P}{R}{O}{C}{E}{D}{U}{R}{E} return(PROCEDURE);
{P}{R}{O}{G}{R}{A}{M} return(PROGRAM);
{P}{R}{O}{P}{E}{R}{T}{Y} return(PROPERTY);
{P}{R}{O}{T}{E}{C}{T}{E}{D} return(PROTECTED);
{P}{U}{B}{L}{I}{C} return(PUBLIC);
{P}{U}{B}{L}{I}{S}{H}{E}{D} return(PUBLISHED);
{R}{A}{I}{S}{E} return(RAISE);
{R}{E}{A}{D} return(READ);
{R}{E}{A}{D}{O}{N}{L}{Y} return(READONLY);
{R}{E}{C}{O}{R}{D} return(RECORD);
{R}{E}{G}{I}{S}{T}{E}{R} return(REGISTER);
{R}{E}{I}{N}{T}{R}{O}{D}{U}{C}{E} return(REINTRODUCE);
{R}{E}{P}{E}{A}{T} return(REPEAT);
{R}{E}{Q}{U}{I}{R}{E}{S} return(REQUIRES);
{R}{E}{S}{I}{D}{E}{N}{T} return(RESIDENT);
{R}{E}{S}{O}{U}{R}{C}{E}{S}{T}{R}{I}{N}{G} return(RESPOURCESTRING);
{S}{A}{F}{E}{C}{A}{L}{L} return(SAFECALL);
{S}{E}{T} return(SET);
{S}{H}{L} return(SHL);
{S}{H}{R} return(SHR);
{S}{T}{D}{C}{A}{L}{L} return(STDCALL);
{S}{T}{O}{R}{E}{D} return(STORED);
{S}{T}{R}{I}{N}{G} return(STRING);
{T}{H}{E}{N} return(THEN);
{T}{H}{R}{E}{A}{D}{V}{A}{R} return(THREADVAR);
{T}{O} return(TO);
{T}{R}{Y} return(TRY);
{T}{Y}{P}{E} return(TYPE);
{U}{N}{I}{T} return(UNIT);
{U}{N}{T}{I}{L} return(UNTIL);
{U}{S}{E}{S} return(USES);
{V}{A}{R} return(VAR);
{V}{I}{R}{T}{U}{A}{L} return(VIRTUAL);
{W}{H}{I}{L}{E} return(WHILE);
{W}{I}{T}{H} return(WITH);
{W}{R}{I}{T}{E} return(WRITE);
{W}{R}{I}{T}{E}{O}{N}{L}{Y} return(WRITEONLY);
{X}{O}{R} return(XOR);

{T}{E}{S}{T} {printf("test!!\n");}

([a-z]|[A-Z])([a-z]|[A-Z]|[0-9])+ return(IDENTIFIER);

":=" return(ASSIGNMENT);
":" return(COLON);
"," return(COMMA);
[0-9] return(DIGIT);
"." return(DOT);
".." return(DOTDOT);
"=" return(EQUAL);
">=" return(GE);
">" return(GT);
"[" return(LBRAC);
"]" return(RBRAC);
"<=" return(LE);
"<" return(LT);
"<>" return(NOTEQUAL);
"+" return(PLUS);
"-" return(MINUS);
([0-9]+)"."([0-9]+)return(REALNUMBER);
"(" return(LPAREN);
")" return(RPAREN);
";" return(SEMICOLON);
"/" return(SLASH);
"*" return(STAR);
"**" return(STARSTAR);
"->"|"^" return(UPARROW);
"(*"|"{" {register int c;
		while((c=input())){
			if(c=="}") break;
			else if(c=='*'){
				if((c=input())==')') break;
				else unput(c);
			}
			else if(c=='\n') line_no++;
			else if(c==0) commenteof();

		}
}
'({NOQUOTE})+' return(CHARACTER_STRING);

[\t\f];

\n line_no++;

. {fprintf(stderr,"%c(0%o):illegal character at line %d.\n",yytext[0],yytext[0],line_no);}


%%

void commenteof(){
	fprintf(stderr,"unexpected end of file at line %d.\n",line_no);
	exit(1);
}
int main(void){
	yylex();
	return 0;
}

int yywrap(){
	return 1;
}