section	.data
   hello db 'Hola clase',13, 10
   len equ $-hello


section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point

   mov ecx,20
	
l1:
   mov eax, 4
   mov ebx, 1
   push ecx
   mov ecx, hello        
   mov edx, len        
   int 0x80
   pop ecx
   loop l1	
   mov eax,1             ;system call number (sys_exit)
   int 0x80              ;call kernel
