; -----------------------------------------------------------------------------
; A 64-bit Linux application that writes the first 90 Fibonacci numbers. To
; assemble and run:
;
;     nasm -felf64 fib.asm && gcc -fPIE -no-pie fibo.o && ./a.out
; -----------------------------------------------------------------------------

        global  main
        extern  printf                  ; from libc

        section .text
main:
;------------------------------------------------------------------------------
; - pushed rbx on the stack
; - set cx to 10
; - set rax to 0
; - set rbx to 1
;------------------------------------------------------------------------------
        push    rbx                     ; push on the stack 

        mov     cx, 10                  ; cx will countdown to 0
        xor     rax, rax                ; rax will hold the current number
        xor     rbx, rbx                ; rbx will hold the next number
        inc     rbx                     ; rbx is originally 1
print:
;------------------------------------------------------------------------------
;
;
;
;------------------------------------------------------------------------------
        ; We need to call printf, but we are using rax, rbx, and rcx.  printf
        ; may destroy rax and rcx so we will save these before the call and
        ; restore them afterwards.

        push    rax                     ; caller-save register
        push    rcx                     ; caller-save register

        ; Stack is already aligned because we pushed three 8 byte (3 x 64 bits)
        ; registers
        mov     rdi, format             ; set 1st parameter (format)
        mov     rsi, rax                ; set 2nd parameter (current_number)
        xor     rax, rax                ; (ABI calling convention)
        call    printf                  ; printf(format, current_number)

        pop     rcx                     ; restore caller-save register
        pop     rax                     ; restore caller-save register
; Fibonacci algorithm
; rax = current number
; rbx = next number
; rcx | ecx | ... = counter
        mov     rdx, rax                ; save the current number
        mov     rax, rbx                ; next number is now current
        add     rbx, rdx                ; get the new next number
        dec     cx                     ; count down
        jnz     print                   ; if not done counting, do some more

        pop     rbx                     ; restore rbx before returning
        ret

        section .rodata ; read-only data section
format: 
        db  "%20ld", 10, 0 ; in C const char format[] = "%20ld\n";
