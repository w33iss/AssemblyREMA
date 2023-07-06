; subroutine which calculates the length of the string
; it returns the length in EAX

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
  pop ebx   ;pop the value on the stack back into EBX
  ret       ;return to where the function was called

; function to print message

sprint:
  push edx
  push ecx
  push ebx
  push eax
  call thelen

  mov edx, eax
  pop eax

  mov ecx, eax
  mov ebx, 1
  mov eax, 4
  int 0x80

  pop ebx
  pop ecx
  pop edx
  ret


; function to exit
exit:
  mov ebx, 0
  mov eax, 1
  int 0x80
  ret

