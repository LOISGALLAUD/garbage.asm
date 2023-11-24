#include <stdio.h>

int main()
{
    int a = 5;
    int b = 3;
    int result;

    // Inline assembly pour l'addition
    asm("add %1, %2;"    // Ajoute %1 et %2 et stocke le résultat dans %0
        : "=r"(result)   // Résultat stocké dans la variable 'result'
        : "r"(a), "r"(b) // Operands a et b
    );

    printf("La somme de %d et %d est : %d\n", a, b, result);

    return 0;
}
