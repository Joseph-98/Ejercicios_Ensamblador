section    .bss
	result resb 1

section .text
   	global _start
	
_start:
	mov    al, 5             ;getting 5 in the al
	mov    bl, 3             ;getting 3 in the bl
	or     al, bl            ;or al and bl registers, result should be 7
	add    al, byte '0'      ;converting decimal to ascii

	mov    [result],  al
	mov    eax, 4
	mov    ebx, 1
	mov    ecx, result
	mov    edx, 1 
	int    0x80
    
salir:
	mov    eax,1
	int    0x80
