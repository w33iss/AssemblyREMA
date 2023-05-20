section .data
message:
        db "Hello World",0

section .bss

section .text
global _start   ; must be declared for linker

_start:           ; linker entry point
  mov eax, 4      ; System call number for "write"
  mov ebx, 1      ; File descriptor (stdout)
  mov ecx, message ; Address of the string to print
  mov edx, 11     ; Length of the string

  int 0x80        ; Call sys_write

; normal exit
exit:
  mov eax, 1      ; System call number for "exit"
  xor ebx, ebx    ; Exit code 0 (successful execution)
  int 0x80        ; Call sys_exit

