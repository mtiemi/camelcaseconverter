

%{
#include <stdio.h>
#include "ccc_lib.h"

    char output1[20];
    char output2[20];

%}

CAMELCASE [A-Z][a-z]+([A-Z][a-z]+)+
UNDERLINE [a-z]+[_][a-z]+
SEQUENCIA [A-z]*[a-z]*

%%

{CAMELCASE}+ {camelcase_to_underline(yytext, output1);
              printf("%s", output1);}

{UNDERLINE}+ {underline_to_camelcase(yytext, output2);
              printf("%s", output2);}

.*{CAMELCASE}+{SEQUENCIA}{UNDERLINE}+.* {printf("ERRO");}

.*{UNDERLINE}+{SEQUENCIA}{CAMELCASE}+.* {printf("ERRO");}

[.\n]* ;

%%

int main() 
{
    output1[0] = '\0';
    output2[0] = '\0';
    yylex();
    printf("\n");
    return 0;
}


