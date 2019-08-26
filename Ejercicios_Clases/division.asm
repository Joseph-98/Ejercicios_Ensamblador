section .data
	msg db "El resultado es: ", 0xA,0xD 
	len equ $- msg   

segment .bss
	res resb 1
	residuo resb 1
	cociente resb 1

section	.text
   global _start    ;must be declared for using gcc
	
_start:             ;tell linker entry point
   mov	ax,'9'
   sub     ax, '0'
	
   mov 	bl, '2'
   sub     bl, '0'

   div 	bl
   add	ax, '0'
	
   mov 	[res], ax
   mov	ecx,msg	
   mov	edx, len
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel
	
   mov	ecx,res
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel

   add	al, '0'
   mov 	[residuo], al
   mov	ecx,residuo
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel

   add	ah, '0'
   mov 	[cociente], ah
   mov	ecx,cociente
   mov	edx, 1
   mov	ebx,1	;file descriptor (stdout)
   mov	eax,4	;system call number (sys_write)
   int	0x80	;call kernel

   mov	eax,1	;system call number (sys_exit)
   int	0x80	;call kernel
