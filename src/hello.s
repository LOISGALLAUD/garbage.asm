.global _start
.intel_syntax noprefix

_start:
  # write
  mov rax, 1
  mov rdi, 1
  lea rsi, [hello_world]
  mov rdx, 14
  syscall
  # exit
  mov rax, 60
  xor rdi, rdi 
  syscall

hello_world:
  .asciz "Hello, world!\n"
