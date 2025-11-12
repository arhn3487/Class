%{
#include "sum.tab.h"
%}

%%

[0-9]+      { yylval.ival = atoi(yytext); return NUMBER; }
[ \t\n]+    ;  // ignore whitespace
"+"         { return '+'; }
"-"         { return '-'; }
"*"         { return '*'; }
"/"         { return '/'; }
"("         { return '('; }
")"         { return ')'; }
.           { return yytext[0]; }

%%

int yywrap() { return 1; }
