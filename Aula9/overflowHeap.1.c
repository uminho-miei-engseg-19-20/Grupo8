#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char **argv) {
    char *dummy = (char *) malloc (sizeof(char) * 10);
    char *readonly = (char *) malloc (sizeof(char) * 10);
	char  * a = argv[1];
	int as = malloc_usable_size(dummy);	
	
	printf("Endereço da variavel dummy: %p\n", dummy);
    printf("Endereço da variavel readonly: %p\n", readonly);
	
	if(strlen(a) > as){
		printf("Error\n");
		return 0;
	}
    strncpy(readonly, "laranjas",sizeof(readonly));
    strncpy(dummy, argv[1], sizeof(dummy));
    printf("%s\n", readonly);
}
