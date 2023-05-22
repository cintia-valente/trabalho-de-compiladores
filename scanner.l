%{
#include "tokens.h"


int Running = 1;
int Lines = 1;


int getLineNumber();
int isRunning();
void printLineNumber();

%}

TOKEN_ID      [a-z0-9_]+
SPECIAL [-,;:\(\)\[\]\{\}+*/<>=]
CHAR    '[^']'
STRING  \"[^"\n]*\"
INT     [0-9]+
FLOAT   [0-9]*[.][0-9]+$

%%

"int" { return TK_PR_INT; }
"float" { return TK_PR_FLOAT; }
"bool" { return TK_PR_BOOL; }
"if" { return TK_PR_IF; }
"else" { return TK_PR_ELSE; }
"while" { return TK_PR_WHILE; }
"return" { return TK_PR_RETURN; }


"<="			return TK_OC_LE;
">="			return TK_OC_GE;
"=="			return TK_OC_EQ;
"!="			return TK_OC_NE;
"&"				return TK_OC_AND;
"|" 			return TK_OC_OR; 
"->" 			return TK_OC_MAP;

[\n]        {Lines++;}
[\t]        {/* Do nothing */ }

%%

int get_line_number() {
	return 1;
}