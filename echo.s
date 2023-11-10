section .data
  buffer resb 100 // reserve 100 bytes for buffer

section .bss:
  prompt db "Type something: ", 0

section .text:
  global _start

_start:
  # print prompt
  mov rax, 1 # sys_write
  mov rdi, 1 # sdout
  mov rsi, prompt
  mov rdx, 17
  syscall

  # read input
  mov rax, 0 # sys_read
  mov rdi, 0 # stdin
  mov rsi, buffer
  mov rdx, 100
  syscall

  # print input
  mov rax, 1 # sys_write
  mov rdi, 1 # stdout
  mov rsi, buffer 
  mov rdx, 100
  syscall

  # exit
  mov rax, 60 # sys_exit
  mov rdi, 0 # exit code
  syscall
