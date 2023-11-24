section .data
  hello_world db "Hello, world!", 10 ; null-terminated string with newline
  len equ $ - hello_world ; length of string

section .text
  global asm_start ; Renommage de _start en asm_start

asm_start:
  ; write
  mov rax, 1         ; syscall number
  mov rdi, 1         ; stdout
  mov rsi, hello_world ; address of string
  mov rdx, len        ; length of string
  syscall

  ; exit
  jmp asm_exit

asm_exit:
  ; exit
  mov rax, 60        ; syscall number
  xor rdi, rdi       ; exit code
  syscall

