section .data
    newline db 0xA  ; newline character

section .text
    global _start

_start:
    mov rdi, [rsp + 8] ; argc
    mov rsi, [rsp + 16] ; argv

    ; check if there is at least one argument
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
    ; write to stdout the first argument
    mov rax, 1
    mov rdi, 1
    mov rsi, rdx
    mov rdx, rcx
    syscall

    ; newline
    mov rax, 1
    mov rdi, 1
    mov rdx, 1
    lea rsi, [newline]
    syscall

no_argument:
    mov rax, 60
    xor rdi, rdi
    syscall