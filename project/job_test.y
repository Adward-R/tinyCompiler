%{

/*

 * grammar.y

 *

 * Pascal grammar in Yacc format, based originally on BNF given

 * in "Standard Pascal -- User Reference Manual", by Doug Cooper.

 * This in turn is the BNF given by the ANSI and ISO Pascal standards,

 * and so, is PUBLIC DOMAIN. The grammar is for ISO Level 0 Pascal.

 * The grammar has been massaged somewhat to make it LALR, and added

 * the following extensions.

 *

 * constant expressions

 * otherwise statement in a case

 * productions to correctly match else's with if's

 * beginnings of a separate compilation facility

 */
extern int yylex();
	
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "lex.yy.c"

void yyerror(char *);	
int line_no = 1;
typedef struct wa{
struct wa*parent;
struct wa*sibling;
struct wa*child[20];
int flag;//how to read;
int type;
int num;
float realnum;
char *word;
char character;
};
//#define YYSTYPE myType
struct wa *root;
%}
%union {
struct wa* tp;
}



%token <tp>AND ARRAY ASSIGN CASE CHARACTER_STRING COLON COMMA CONST INTEGER DO DR DF DOT DOTDOT DOWNTO ELSE END EQUAL FOR FUNCTION GE GOTO GT ID IF LB LE LP LT MINUS MOD NOT UNEQUAL OF OR BEGIN_WA PLUS PROCEDURE PROGRAM RB REAL RECORD REPEAT RP SEMI DIV MUL THEN TO TYPE UNTIL UPARROW VAR WHILE CHAR STRING NAME READ SYS_CON SYS_TYPE SYS_PROC SYS_FUNCT
%type <tp>program program_head routine sub_routine routine_head label_part const_part const_expr_list const_value type_part type_decl_list type_definition type_decl array_type_decl record_type_decl field_decl_list field_decl name_list simple_type_decl var_part var_decl_list var_decl routine_part function_decl function_head procedure_decl procedure_head parameters para_decl_list para_type_list var_para_list val_para_list routine_body stmt_list stmt non_label_stmt assign_stmt proc_stmt compound_stmt if_stmt else_clause repeat_stmt while_stmt for_stmt direction case_stmt case_expr_list case_expr goto_stmt expression_list expression expr term factor args_list
%%



program : program_head  routine  DOT {
//printf("wa\n");
$$ = (struct wa *)malloc(sizeof(struct wa));
$$->child[0]=(struct wa *)malloc(sizeof(struct wa));
$$->child[1]=(struct wa *)malloc(sizeof(struct wa));
$$->child[2]=(struct wa *)malloc(sizeof(struct wa));

$$->child[0]=$1;
$$->child[1]=$2;
$$->child[2]=$3;
root = (struct wa *)malloc(sizeof(struct wa));

root = $$;
root ->num = 10;

};

program_head : PROGRAM  ID  SEMI;

routine : routine_head  routine_body;

sub_routine : routine_head  routine_body;

routine_head : label_part  const_part  type_part  var_part  routine_part;

label_part : ;

const_part : CONST  const_expr_list  |  ;

const_expr_list : const_expr_list  ID  EQUAL  const_value  SEMI

|  ID  EQUAL  const_value  SEMI;

const_value : INTEGER  |  REAL  |  CHAR  |  STRING  |  SYS_CON | ;

type_part : TYPE type_decl_list  |  ;

type_decl_list : type_decl_list  type_definition  |  type_definition;

type_definition : ID  EQUAL  type_decl  SEMI;

type_decl : simple_type_decl  |  array_type_decl  |  record_type_decl;

array_type_decl : ARRAY  LB  simple_type_decl  RB  OF  type_decl;

record_type_decl : RECORD  field_decl_list  END;

field_decl_list : field_decl_list  field_decl  |  field_decl;

field_decl : name_list  COLON  type_decl  SEMI;

name_list : name_list  COMMA  ID  |  ID;

simple_type_decl : SYS_TYPE  |  ID  |  LP  name_list  RP  

                |  const_value  DOTDOT  const_value  

                |  MINUS  const_value  DOTDOT  const_value

                |  MINUS  const_value  DOTDOT  MINUS  const_value

                |  ID  DOTDOT  ID;

var_part : VAR  var_decl_list  |  ;

var_decl_list :  var_decl_list  var_decl  |  var_decl;

var_decl :  name_list  COLON  type_decl  SEMI;

routine_part:  routine_part  function_decl  |  routine_part  procedure_decl

           |  function_decl  |  procedure_decl |;

function_decl : function_head  SEMI  sub_routine  SEMI;

function_head :  FUNCTION  ID  parameters  COLON  simple_type_decl ;

procedure_decl :  procedure_head  SEMI  sub_routine  SEMI;

procedure_head :  PROCEDURE ID parameters ;

parameters : LP  para_decl_list  RP  |  ;

para_decl_list : para_decl_list  SEMI  para_type_list;

para_type_list : var_para_list COLON  simple_type_decl 

|  val_para_list  COLON  simple_type_decl;

var_para_list : VAR  name_list;

val_para_list : name_list;

routine_body : compound_stmt;

stmt_list : stmt_list  stmt  SEMI  |  ;

stmt : INTEGER  COLON  non_label_stmt  |  non_label_stmt;

non_label_stmt : assign_stmt | proc_stmt | compound_stmt | if_stmt | repeat_stmt | while_stmt 

| for_stmt | case_stmt | goto_stmt;





assign_stmt : ID  ASSIGN  expression

           | ID LB expression RB ASSIGN expression

           | ID  DOT  ID  ASSIGN  expression;

proc_stmt : ID

          |  ID  LP  args_list  RP

          |  SYS_PROC

          |  SYS_PROC  LP  expression_list  RP

          |  READ  LP  factor  RP;

compound_stmt : BEGIN_WA  stmt_list  END;

if_stmt : IF  expression  THEN  else_clause;

else_clause : ELSE stmt |  ;

repeat_stmt : REPEAT  stmt_list  UNTIL  expression;

while_stmt : WHILE  expression  DO stmt;

for_stmt : FOR  ID  ASSIGN  expression  direction  expression  DO stmt;

direction : TO | DOWNTO;

case_stmt : CASE expression OF case_expr_list  END;

case_expr_list : case_expr_list  case_expr  |  case_expr;

case_expr : const_value  COLON  stmt  SEMI

          |  ID  COLON  stmt  SEMI;

goto_stmt : GOTO  INTEGER;

expression_list : expression_list  COMMA  expression  |  expression;

expression : expression  GE  expr  |  expression  GT  expr  |  expression  LE  expr

          |  expression  LT  expr  |  expression  EQUAL  expr  

|  expression  UNEQUAL  expr  |  expr;

expr : expr  PLUS  term  |  expr  MINUS  term  |  expr  OR  term  |  term;

term : term  MUL  factor  |  term  DIV  factor  |  term  MOD  factor 

 |  term  AND  factor  |  factor;

factor : ID  |  ID  LP  args_list  RP  |  SYS_FUNCT

 LP  args_list  RP  |  const_value  |  LP  expression  RP

|  NOT  factor  |  MINUS  factor  |  ID  LB  expression  RB

|  ID  DOT  ID;

args_list : args_list  COMMA  expression  |  expression;



%%

int main()
{
yyparse();
printf("%d\n",root->num);
return 0;
}

void yyerror(char * s){

	printf("line %d: ERROR! %s\n",line_no, s);

}
