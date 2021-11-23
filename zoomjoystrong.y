%{
#include <stdio.h>
#include "zoomjoystrong.h"
void yyerror(const char* errDisplay);
extern int yylex();
extern int yylineno;
%}

%union{
int fVal;
}

%start program

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INTEGER
%token FLOAT
%type<fVal> INTEGER

%%

program:	statement_list
       ;

statement:	END END_STATEMENT	{finish();}
	 |	POINT INTEGER INTEGER END_STATEMENT	{point($2,$3);}
	|	LINE INTEGER INTEGER INTEGER INTEGER END_STATEMENT	{line($2,$3,$4,$5);}
	|	CIRCLE INTEGER INTEGER INTEGER END_STATEMENT	{circle($2,$3,$4);}
	|	RECTANGLE INTEGER INTEGER INTEGER INTEGER END_STATEMENT	{rectangle($2,$3,$4,$5);}
	|	SET_COLOR INTEGER INTEGER INTEGER END_STATEMENT	{set_color($2,$3,$4);}

statement_list:	statement
	      |	statement statement_list
		;
%%

int main(){
	setup();
	yyparse();
	finish();
	return 0;
}

void yyerror(const char* errDisplay){
	fprintf(stderr, "Line %d:\n%s\n", yylineno,errDisplay);
}
