#PASCEL Syntax Grammar (CFG)

========
	
	program : program_head routine DOT
	
	
	
	
	
	
		 | ε
	
		| ID EQUAL const_value SEMI
	
		| REAL 
		| CHAR 
		| STRING
		| SYS_CON
	
		| ε
	
		| type_definition
	
	
		| array_type_decl 
		| record_type_decl
	
	
	
		| field_decl
	
	
		| ID
	
		| ID 
		| LP name_list RP 
		| const_value DOTDOT const_value 
		| MINUS const_value DOTDOT const_value 
		| MINUS const_value DOTDOT MINUS const_value 
		| ID DOTDOT ID
	
		| ε
	
		| var_decl
	
	
		| routine_part procedure_decl 
		| function_decl
		| procedure_decl
	
	
	
	
	
		| ε
	
	
		| val_para_list COLON simple_type_decl
	
	
	
	
		| ε
	
		| non_label_stmt
	
		| proc_stmt 
		| compound_stmt 
		| if_stmt 
		| repeat_stmt 
		| while_stmt 
		| for_stmt 
		| case_stmt 
		| goto_stmt
		| ID LB expression RB ASSIGN expression
		| ID DOT ID ASSIGN expression
      
		| ID LP args_list RP 
		| SYS_PROC
		| SYS_PROC LP expression_list RP
		| READ LP factor RP
	else_clause : ELSE stmt 
		| ε
	while_stmt : WHILE expression DO stmt
	for_stmt : FOR ID ASSIGN expression direction expression DO stmt
	direction : TO 
		| DOWNTO
	case_stmt : CASE expression OF case_expr_list END
	case_expr_list : case_expr_list case_expr 
		| case_expr
		| ID COLON stmt SEMI
	goto_stmt : GOTO INTEGER
	expression_list : expression_list COMMA expression 
		| expression
	expression : expression GE expr 
		| expression GT expr 
		| expression LE expr
     	| expression EQUAL expr 
		| expr
		
		| expr MINUS term 
		| expr OR term | term
		| term DIV factor 
		| term MOD factor 
		| factor
	factor : ID 
		| ID LP args_list RP 
		| SYS_FUNCT SYS_FUNCT LP args_list RP 
		| const_value 
		| LP expression RP
		| MINUS factor 
		| ID LB expression RB
		| expression
- COLON为`,`
