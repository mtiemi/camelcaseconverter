%{

// Mariane Tiemi Iguti RA: 147279
// Lab 2 - EA876
#include <stdio.h>
#include "ccc_lib.h"

    char output1[20]; // strings que guardam a resposta
    char output2[20];

%}

CAMELCASE [A-Z][a-z]+([A-Z][a-z]+)+
UNDERLINE [a-z]+[_][a-z]+
SEQUENCIA [A-z]*[a-z]*    

%%

{CAMELCASE}+ {camelcase_to_underline(yytext, output1); // converte camelcase em underline
              printf("%s", output1);}  

{UNDERLINE}+ {underline_to_camelcase(yytext, output2); // converte underline para camelcase
              printf("%s", output2);} 

.*{CAMELCASE}+{SEQUENCIA}{UNDERLINE}+.* {printf("ERRO");} // caso tiver camelcase e underline misturados nessa ordem

.*{UNDERLINE}+{SEQUENCIA}{CAMELCASE}+.* {printf("ERRO");} // caso tiver underline e underline misturados nessa ordem

[.\n]* ;

%%

int main() 
{
    output1[0] = '\0'; // inicializando os vetores de strings
    output2[0] = '\0';
    yylex();
    printf("\n");
    return 0;
}


