;hello world program(Calculating the string length using pointer arithmetic)
; compile with: nasm -f elf helloworld-len.asm
;then link with ld -m elf_i386 helloworld-len.o -o helloworld-len
; Run with ./helloworld-len

section .data
message:
        db "Hello Weiss, how are you doing?",0Ah

section .bss

section .text
global _start   ; must be declared for linker

_start:

  mov ebx,message ;mov address of message to ebx
  mov eax,ebx     ;mov address in ebx to eax (both now pointing to same memory segment)

nextchar:
  cmp byte[eax],0 ; compare byte pointed by eax at this address against 0
  jz  finished    ; jump if ZF is set to the finished block
  inc eax         ; increment the address in EAX by one byte (ZF not set)
  jmp nextchar   ; jump to the nextchar block

finished:
  sub eax, ebx  ; get the number of bytes between the registers by subtracting one memory address
                ; from another of the same type
  mov edx, eax  ; bytes to write
  mov ecx, message ; the buffer
  mov ebx, 1
  mov eax, 4
  int 0x80

; normal exit
exit:
  mov eax, 1      ; sys_exit syscall
  xor ebx, ebx    ; Exit code 0 (successful execution)
  int 0x80        ; INT request on libc
