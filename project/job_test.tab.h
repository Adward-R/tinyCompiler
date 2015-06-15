/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
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
     DR = 268,
     DF = 269,
     DOT = 270,
     DOTDOT = 271,
     DOWNTO = 272,
     ELSE = 273,
     END = 274,
     EQUAL = 275,
     FOR = 276,
     FUNCTION = 277,
     GE = 278,
     GOTO = 279,
     GT = 280,
     ID = 281,
     IF = 282,
     LB = 283,
     LE = 284,
     LP = 285,
     LT = 286,
     MINUS = 287,
     MOD = 288,
     NOT = 289,
     UNEQUAL = 290,
     OF = 291,
     OR = 292,
     BEGIN_WA = 293,
     PLUS = 294,
     PROCEDURE = 295,
     PROGRAM = 296,
     RB = 297,
     REAL = 298,
     RECORD = 299,
     REPEAT = 300,
     RP = 301,
     SEMI = 302,
     DIV = 303,
     MUL = 304,
     THEN = 305,
     TO = 306,
     TYPE = 307,
     UNTIL = 308,
     UPARROW = 309,
     VAR = 310,
     WHILE = 311,
     CHAR = 312,
     STRING = 313,
     NAME = 314,
     READ = 315,
     SYS_CON = 316,
     SYS_TYPE = 317,
     SYS_PROC = 318,
     SYS_FUNCT = 319
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 2068 of yacc.c  */
#line 55 "job_test.y"

struct wa* tp;



/* Line 2068 of yacc.c  */
#line 120 "job_test.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


