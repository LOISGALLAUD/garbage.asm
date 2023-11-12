section .data
    newline db 0xA  ; caractère de nouvelle ligne

section .text
    global _start

_start:
    ; argc (nombre d'arguments)
    mov rdi, [rsp + 8]

    ; argv (pointeur vers le tableau d'arguments)
    mov rsi, [rsp + 16]

    ; vérifier si au moins un argument est passé
    cmp rdi, 1
    jle no_argument

    ; pointeur vers le premier caractère du premier argument
    mov rdx, [rsi + 8]

    ; longueur du premier argument
    mov rcx, 0
find_length:
    cmp byte [rdx + rcx], 0
    je found_length
    inc rcx
    jmp find_length
found_length:

    ; syscall number for sys_write
    mov rax, 1

    ; file descriptor for stdout
    mov rdi, 1

    ; pointer to the message
    mov rdx, rcx

    ; invoke syscall
    syscall

    ; newline
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    lea rsi, [newline]
    syscall

no_argument:
    ; syscall number for sys_exit
    mov rax, 60

    ; exit code 0
    xor rdi, rdi

    ; invoke syscall
    syscall

