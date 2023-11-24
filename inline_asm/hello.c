#include <stdio.h>

void hello()
{
    asm("movl $4, %%eax;" // Appel système pour écrire sur la sortie standard
        "movl $1, %%ebx;" // Descripteur de fichier pour la sortie standard
                          // (stdout)
        "movl $hello_msg, %%ecx;" // Adresse du message à imprimer
        "movl $5, %%edx;"         // Longueur du message
        "int $0x80;" // Appel système pour écrire sur la sortie standard
        "ret;"       // Retour de la fonction
        "hello_msg: .ascii \"Hello\\n\";" // Déclaration du message
    );
}

int main()
{
    hello();
    return 0;
}
