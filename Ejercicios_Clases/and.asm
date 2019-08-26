section   .data
   par_msg  db  'Número par' 
   len1  equ  $ - par_msg 
   
   impar_msg db  'Número impar' 
   len2  equ  $ - impar_msg

section .text
   global _start            
	
_start:                     
   mov   ax, 9h           ;getting 8 in the ax 
   and   ax, 1              ;and ax with 1
   jz    par
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, impar_msg       ;message to write
   mov   edx, len2          ;length of message
   int   0x80               ;call kernel
   jmp   impar

par:   
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, par_msg      ;message to write
   mov   edx, len1          ;length of message
   int   0x80               ;call kernel

impar:
   mov   eax,1              ;system call number (sys_exit)
   int   0x80               ;call kernel
