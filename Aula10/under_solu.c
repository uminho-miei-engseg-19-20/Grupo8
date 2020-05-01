#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const int MAX_SIZE = 2048;


void vulneravel (char *origem, size_t tamanho) {
        size_t tamanho_real;
        char *destino;
        if (tamanho > 1 && tamanho < MAX_SIZE) {
				
                tamanho_real = tamanho - 1; // Não copiar \0 de origem para destino
                destino = (char *) malloc(tamanho_real);
				
                
        }
		else{ printf("tamanho pequeno\n");}
}

int main() {
		char *o = (char *) malloc(sizeof(char));
		
        vulneravel(o,0);
}
