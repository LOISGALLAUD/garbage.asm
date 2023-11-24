nasm -f elf64 -w+all hello_world.asm -o hello_world.o
gcc helloc.c hello_world.o -o helloc
