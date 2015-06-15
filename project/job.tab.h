#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   enum yytokentype {
     AND = 258,
     ARRAY = 259,
     ASSIGN = 260,
     CASE = 261,
     CHARACTER_STRING = 262,
     COLON = 263,
     COMMA = 264,
     CONST = 265,
     INTEGER = 266,
     DO = 267,
     DOT = 268,
     DOTDOT = 269,
     DOWNTO = 270,
     ELSE = 271,
     END = 272,
     EQUAL = 273,
     FOR = 274,
     FUNCTION = 275,
     GE = 276,
     GOTO = 277,
     GT = 278,
     ID = 279,
     IF = 280,
     LB = 281,
     LE = 282,
     LP = 283,
     LT = 284,
     MINUS = 285,
     MOD = 286,
     NOT = 287,
     UNEQUAL = 288,
     OF = 289,
     OR = 290,
     BEGIN = 291,
     PLUS = 292,
     PROCEDURE = 293,
     PROGRAM = 294,
     RB = 295,
     REAL = 296,
     RECORD = 297,
     REPEAT = 298,
     RP = 299,
     SEMI = 300,
     DIV = 301,
     MUL = 302,
     THEN = 303,
     TO = 304,
     TYPE = 305,
     UNTIL = 306,
     UPARROW = 307,
     VAR = 308,
     WHILE = 309,
     CHAR = 310,
     STRING = 311,
     NAME = 312,
     READ = 313,
     SYS_CON = 314,
     SYS_TYPE = 315,
     SYS_PROC = 316,
     SYS_FUNCT = 317
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


