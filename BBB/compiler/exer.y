%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%union {
    int ival;
}

%token <ival> NUMBER

%%

expression:
      expression '+' term   { /* valid */ }
    | expression '-' term   { /* valid */ }
    | term                  { /* valid */ }
    ;

term:
      term '*' factor       { /* valid */ }
    | term '/' factor       { /* valid */ }
    | factor                { /* valid */ }
    ;

factor:
      '(' expression ')'    { /* valid */ }
    | NUMBER                { /* valid */ }
    ;

%%

void yyerror(const char *s) {
    printf("Syntax error.\n");
    exit(1);
}

int main() {
    if (yyparse() == 0) {
        printf("Expression is valid.\n");
    }
    return 0;
}
