%{
#include <stdio.h>
#include <string.h>
#include "job_test.tab.h"
extern int line_no;
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
NQUOTE [^']

%%
{F}{A}{L}{S}{E}|{T}{R}{U}{E}|{M}{A}{X}{I}{N}{T} {return(SYS_CON);}
{B}{O}{O}{L}{E}{A}{N}|{C}{H}{A}{R}|{I}{N}{T}{E}{G}{E}{R}|{R}{E}{A}{L} return(SYS_TYPE);
{W}{R}{I}{T}{E}|{W}{R}{I}{T}{E}{L}{N} return(SYS_PROC);
{A}{B}{S}|{C}{H}{R}|{O}{D}{D}|{O}{R}{D}|{P}{R}{E}{D}|{S}{Q}{R}{T}|{S}{U}{C}{C} return(SYS_FUNCT);
{A}{N}{D}   return(AND);
{A}{R}{R}{A}{Y}   return(ARRAY);
{C}{A}{S}{E}   return(CASE);
{C}{O}{N}{S}{T}   return(CONST);
{D}{I}{V}   return(DIV);
{D}{O}    return(DO);
{D}{O}{W}{N}{T}{O}  return(DOWNTO);
{E}{L}{S}{E}   return(ELSE);
{E}{N}{D}   return(END);
{F}{O}{R}   return(FOR);
{F}{U}{N}{C}{T}{I}{O}{N} return(FUNCTION);
{G}{O}{T}{O}   return(GOTO);
{I}{F}    return(IF);
{M}{O}{D}   return(MOD);
{N}{O}{T}   return(NOT);
{O}{F}    return(OF);
{O}{R}    return(OR);
{B}{E}{G}{I}{N}   return(BEGIN_WA);
{P}{R}{O}{C}{E}{D}{U}{R}{E} return(PROCEDURE);
{P}{R}{O}{G}{R}{A}{M}  return(PROGRAM);
{R}{E}{C}{O}{R}{D}  return(RECORD);
{R}{E}{P}{E}{A}{T}  return(REPEAT);
{T}{H}{E}{N}   return(THEN);
{T}{O}    return(TO);
{T}{Y}{P}{E}   return(TYPE);
{U}{N}{T}{I}{L}   return(UNTIL);
{V}{A}{R}   return(VAR);
{W}{H}{I}{L}{E}   return(WHILE);
{R}{E}{A}{D} return(READ);
[A-Z|a-z|"_"][A-Z|a-z|"_"|0-9]* return(ID);

":="    return(ASSIGN);
"'"[a-z|A-Z|0-9]"'"  return(CHAR);
"'"[a-z|A-Z|0-9][a-z|A-Z|0-9]+"'" return(STRING);
":"    return(COLON);
","    return(COMMA);
[0-9]+    return(INTEGER);
"."    return(DOT);
".."    return(DOTDOT);
"="    return(EQUAL);
">="    return(GE);
">"    return(GT);
"["    return(LB);
"]"    return(RB);
"<="    return(LE);
"<"    return(LT);
"("    return(LP);
")"    return(RP);
"-"    return(MINUS);
"<>"    return(UNEQUAL);
"+"    return(PLUS);
[0-9]+"."[0-9]+   return(REAL);
";"    return(SEMI);
"/"    return(DIV);
"*"    return(MUL);
[ \t\f]    ;

\n    line_no++;

.    { fprintf (stderr,
    "'%c' (0%o): illegal charcter at line %d\n",
     yytext[0], yytext[0], line_no);
    }

%%

commenteof()
{
 fprintf (stderr, "unexpected EOF inside comment at line %d\n",line_no);
 exit (1);
}

yywrap ()
{
 return (1);
}



