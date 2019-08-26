%macro escribir 2 
	mov eax, 4
	mov ebx, 2
	mov ecx, %1
	mov edx, %2
	int 80h
%endmacro

section .data
	msj db "Leer el archivo:", 10
	len equ $ -msj
	path db "/home/joshep/Escritorio/Ensamblador/archivob.txt", 0

section .bss
	texto resb 30
	idarchivo resd 1
	
section .text
	global _start

_start:

	; *********apertura del archivo*******	
	mov eax, 5         ; servicio para abrir el archivo
	mov ebx, path      ; direccion del archivo
	mov ecx, 0         ; modo de acceso, read only = 0
	mov edx, 0         ; permisos de archivo
	int 80h            ; igual a int 80h
	
	test eax, eax  ; si existe un error se va activar ZR
	jz salir
	
	; ******* archivo sin excepciones ****
	mov dword [idarchivo], eax    ; respaldo el id del archivo
	
	escribir msj, len 
	
	mov eax, 3
	mov ebx, [idarchivo]
	mov ecx, texto
	mov edx, 30
	int 80h
	
	escribir texto, 25
	
	; *********cerrar el archivo*******	
	mov eax, 6               ; servicio para abrir el archivo
	mov ebx, [idarchivo]     ; identificador del archivo
	mov ecx, 0               
	mov edx, 0              
	int 80h                
	
salir:	
	mov eax,1
	int 80h
