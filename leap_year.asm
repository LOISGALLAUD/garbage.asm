section .text
global leap_year
leap_year:
    ; Argument is passed in the rdi register

    ; Check if the year is divisible by 4
    mov rax, rdi
    mov rbx, 4
    xor rdx, rdx
    div rbx
    test rdx, rdx  ; Check if the remainder is zero
    jnz not_leap_year  ; If not zero, jump to not_leap_year

    ; Check if the year is divisible by 100
    mov rax, rdi
    mov rbx, 100
    xor rdx, rdx
    div rbx
    test rdx, rdx  ; Check if the remainder is zero
    jnz is_leap_year   ; If not zero, jump to leap_year

    ; Check if the year is divisible by 400
    mov rax, rdi
    mov rbx, 400
    xor rdx, rdx
    div rbx
    test rdx, rdx  ; Check if the remainder is zero
    jnz not_leap_year  ; If not zero, jump to not_leap_year

    is_leap_year:
        mov rax, 1  ; Return true (1) for leap year
        ret

    not_leap_year:
        xor rax, rax  ; Return false (0) for non-leap year
        ret

%ifidn __OUTPUT_FORMAT__,elf64
section .note.GNU-stack noalloc noexec nowrite progbits
%endif
