%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
FILE  *yyin;
%}

%option noyywrap
%option yylineno

DIGITO			      [0-9]
LETRA			        [a-zA-Z]
CTE               {DIGITO}+
ID			          {LETRA}({LETRA}|{DIGITO}|_)*
OP_AS   		      ":="
PARA              "("
PARC              ")"
AVG               "avg"
COMA              ","

%%
{OP_AS}			        { return OP_AS;    }
{PARA}         			{ return PARA;     }
{PARC}         			{ return PARC;     }
{AVG}         			{ return AVG;      }
{COMA}         			{ return COMA;     }


{ID}			{ yylval.str_val = yytext; return ID;}
{CTE}		  { yylval.intval = atoi(yytext); return CTE;}

"\n"
"\t"
