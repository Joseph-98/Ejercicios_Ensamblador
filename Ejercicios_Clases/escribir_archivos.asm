%macro escribir 2 
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	msj db "Escribir el archivo:", 10
	len equ $ -msj
	path db "/home/joshep/Escritorio/Ensamblador/archivo1b.txt", 0

section .bss
	texto resb 30
	idarchivo resd 1
	
section .text
	global _start

_start:

	; *********apertura del archivo*******	
	mov eax, 8         ; servicio para crear y escribir en archivo
	mov ebx, path      ; direccion del archivo
	mov ecx, 2         ; modo de acceso, = 2
	mov edx, 200h      ; permisos de archivo
	int 80h            ; igual a int 80h
	
	test eax, eax   ; test es un and sin modificar sus operandos, solo modifica banderas
	jz salir
	
	; ******* archivo sin excepciones ****
	mov dword [idarchivo], eax    ; respaldo el id del archivo
	
	escribir msj, len 
	
	mov eax, 3
	mov ebx, 2
	mov ecx, texto
	mov edx, 15
	int 80h
	
	mov eax, 4
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 15
	int 80h
            
	
salir:	
	mov eax,1
	int 80h
