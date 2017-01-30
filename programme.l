%{
#include "y.tab.h"
%}

%%	
";"		{return PVG;}
"print"		{return print;}	
"exit"		{return exit_cmd;}
[a-zA-Z]	{return IDF;}
[0-9]+		{return number;}
[-+=]		{return yytext[0];}
.		{yyerror("Tokens unexpected");}
%%
int yywrap (void) {return 1;}

