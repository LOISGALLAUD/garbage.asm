section .data
  prompt db "Type something: ", 10
  len equ $ - prompt

section .bss
  buffer resb 100 ; réserve 100 octets pour le tampon

section .text
  global _start

_start:
  ; print prompt
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, prompt
  mov rdx, len
  syscall

  ; read input
  mov rax, 0 ; sys_read
  mov rdi, 0 ; stdin
  mov rsi, buffer
  mov rdx, 100
  syscall

  ; print input
  mov rax, 1 ; sys_write
  mov rdi, 1 ; stdout
  mov rsi, buffer 
  mov rdx, 100
  syscall

  ; exit
  mov rax, 60 ; sys_exit
  xor rdi, rdi ; exit code
  syscall
