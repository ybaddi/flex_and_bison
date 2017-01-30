%{
void yyerror (char *s);
#include <stdio.h>
#include <stdlib.h>
void updateSymbole(char token, int val);
int   valueOf(char token);
%}
%union {int num; char idf };
%start line
%token print
%token exit_cmd
%token PVG
%token <num> number
%token <idf> IDF
%type <num> line exp term
%type <idf> inst

%%

line    : exit_cmd ';'  {exit(1);}
         | print exp ';'        {printf("the result is %d",$2);}
        | inst ';'   {;}
        ;
inst : IDF '=' exp   {updateSymbole($1,$3);}
        ;
exp : term      {$$=$1;}
        | exp '+' exp   {$$ = $1 + $3;}
        | exp '-' exp   {$$ = $1 - $3;}
        ;
term : number   {$$ = $1;}
        | IDF   {$$ = valueOf($1);}
        ;
%%
void updateSymbole(char x, int y){

}

int valueOf(char token){
}


void yyerror (char *s) {fprintf (stderr, "%s\n",s);}

