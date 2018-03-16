
#include "ccc_lib.h"


void camelcase_to_underline(char *input, char *output) {

  int i = 0, j = 0;
  
  while(input[i] != '\0')
  {
    if(i == 0) // converte a primeira letra em minusculo
    {
        output[j] = input[i] + 32;
        j++;
    }else
    {
        if(input[i] >= 65 && input[i] <= 90) //encontrando a letra maiscula no meio da string
        {
            output[j] = 95; // troca a maiscula por underline
            j++;
            output[j] = input[i] + 32;
            j++;
        }else
        {
            output[j] = input[i];
            j++;
        }
    }
   i++;;
  }
    
  return;
}

void underline_to_camelcase(char *input, char *output) 
{

    int i = 0, j = 0;
  
  while(input[i] != '\0')
  {
    if(i == 0) // converte a primeira letra em maisculo
    {
        output[j] = input[i] - 32;
        j++;
    }else
    {
        if(input[i] == 95) //encontrando o underline
        {
            i++; // le o proximo caractere
            output[j] = input[i] - 32; //coloca a maiuscula
            j++;
            
        }else
        {
            output[j] = input[i];
            j++;
        }
    }
    i++;
  }
  
  return;
}



