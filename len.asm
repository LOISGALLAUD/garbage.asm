section .data
  prompt db "Type something: ", 10
  promptLen equ $-prompt

section .bss
  bufferLen equ 100
  buffer resb bufferLen

section .text
  global _start

_start:
  ; print prompt
  mov rax, 1
  mov rdi, 1
  mov rsi, prompt
  mov rdx, promptLen
  syscall

  ; read input
  mov rax, 0
  mov rdi, 0
  mov rsi, buffer
  mov rdx, bufferLen
  syscall

  ; find input length
  mov ebx, buffer
  mov eax, ebx
  nextchar:
    cmp byte [eax], 0
    je end
    inc eax
    jmp nextchar
  end:
  sub eax, ebx

  ; print input
  mov rax, 1
  mov rdi, 1
  mov rsi, buffer
  mov rdx, eax
  syscall

  ; exit
  mov rax, 60
  mov rdi, 0
  syscall
