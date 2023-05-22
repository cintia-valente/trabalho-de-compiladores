%option yylineno

%{
#include "tokens.h"

int Lines = 1;


int getLineNumber();

%}

TOKEN_ID      [a-z0-9_]+
SPECIAL [-!*/%+-<>{}()=,;]
CHAR    '[^']'
STRING  \"[^"\n]*\"
INT     [0-9]+
FLOAT   [0-9]*[.][0-9]+$
TRUE    "true"
FALSE   "false"

%%

"int" 		{ return TK_PR_INT; }
"float" 	{ return TK_PR_FLOAT; }
"bool" 		{ return TK_PR_BOOL; }
"if" 		{ return TK_PR_IF; }
"else" 		{ return TK_PR_ELSE; }
"while" 	{ return TK_PR_WHILE; }
"return"	{ return TK_PR_RETURN; }

{INT}     { return TK_LIT_INT; }
{FLOAT}   { return TK_LIT_FLOAT; }
{TRUE}    { return TK_LIT_TRUE; }
{FALSE}   { return TK_LIT_FALSE; }


{SPECIAL} { return yytext[0]; }


"<="			return TK_OC_LE;
">="			return TK_OC_GE;
"=="			return TK_OC_EQ;
"!="			return TK_OC_NE;
"&"				return TK_OC_AND;
"|" 			return TK_OC_OR; 
"->" 			return TK_OC_MAP;

[\n]        { Lines++; }
[ \t]+      {/* Skips blanks and tabs */ }

%%

int get_line_number() {
	return Lines;
}