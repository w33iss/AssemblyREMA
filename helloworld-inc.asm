;using external file include
;compile nasm -f elf helloworld-inc.asm
;Linker ld -m elf_i386 heloworld-inc-o helloworld-inc

%include 'functions.asm' ;the external file to include

section .data
msg1  db "Hello, love includes in assembly!", 0Ah
msg2  db "This is the recycle in the NASM, assembly is rocking!", 0Ah

section .text
global _start

_start:

	mov eax, msg1
	call sprint

	mov eax, msg2
	call sprint

	call exit
