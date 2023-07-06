;hello world program(subroutines)
; compile with: nasm -f elf hellosubroutine.asm
;then link with ld -m elf_i386 helloworldsubroutine.o -o helloworld-sub
; Run with ./helloworld-sub

section .data
message:
        db "Hello Weiss, how are you doing?",0Ah

section .bss

section .text
global _start   ; must be declared for linker

_start:

  mov eax,message ;mov address of message to eax
  call thelen     ;call a function to get the length

  mov edx, eax  ; store function results
  mov ecx, message
  mov ebx, 1
  mov eax, 4
  int 0x80        ; Call sys_write
exit:
  mov eax, 1      ; sys_exit syscall
  xor ebx, ebx    ; Exit code 0 (successful execution)
  int 0x80        ; INT request on libc

thelen:
  push ebx ; push the value in EBX onto the stack to preserve it while we use EBX in this function
  mov ebx, eax ; mov address in eax into EBX

nextchar:
  cmp byte[eax],0 ; compare byte pointed by eax at this address against 0
  jz  finished    ; jump if ZF is set to the finished block
  inc eax         ; increment the address in EAX by one byte (ZF not set)
  jmp nextchar   ; jump to the nextchar block

finished:
  sub eax, ebx  ; get the number of bytes between the registers by subtracting one memory address
                ; from another of the same type
  pop ebx
  ret ; return to where the function was called
; normal exit

