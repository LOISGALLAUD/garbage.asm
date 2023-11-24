#include <stdio.h>
#include <sys/syscall.h>
#include <unistd.h>

extern void asm_start(); // Utilisation du nouveau nom asm_start

int main()
{
    printf("Calling assembly function...\n");

    asm_start(); // Appel de la fonction assembleur

    printf("Assembly function called.\n");
    return 0;
}
