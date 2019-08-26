section	.data
   asterisco db '*'
   len_asterisco equ $-asterisco
   new_line db 10,''

section .bss
  contador_bx resb 1 
  contador_cx resb 1 
section	.text
   global _start        ;must be declared for using gcc
	
_start:	                ;tell linker entry point
   mov ecx,10
   mov ebx,10

l1:
   push ecx  		; se guarda en pila ecx 10   
   mov ebx,ecx
   push ebx		; se guarda en pila ebx 10
   call imprimir_enter  ; se modifica ecx = mensaje y ebx = 1
   pop ebx
   mov ecx,ebx
   push ebx
l3:
   push ecx  		; se guarda en pila ecx 10   
   call imprimir  ; se modifica ecx = mensaje y ebx = 1
   pop ecx
   loop l3	

   pop ecx
   pop ebx
   mov ecx,ebx
   loop l1	

   mov eax,1             ;system call number (sys_exit)
   int 0x80              ;call kernel

   	
imprimir:
   mov eax, 4
   mov ebx, 1
   mov ecx, asterisco        
   ;mov ecx, contador_cx              
   mov edx, 1  
   int 0x80
   ret

imprimir_enter:
   mov eax, 4
   mov ebx, 1
   
   mov ecx, new_line
   
   ;mov ecx, contador_cx              
   mov edx, 1  
   int 0x80


   ret
