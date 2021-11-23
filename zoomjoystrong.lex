%{
#include "zoomjoystrong.tab.h"
#include <stdlib.h>
%}

%option noyywrap

%%

end {return END;}
[;] {return END_STATEMENT;}
point {return POINT;}
line {return LINE;}
circle {return CIRCLE;}
rectangle {return RECTANGLE;}
set_color {return SET_COLOR;}
[0-9]+ {yylval.fVal = atof(yytext); return INTEGER;}
[0-9]+\.[0-9]+ {yylval.fVal = atof(yytext); return FLOAT;}
[\t\n\r] ;

%%
