global _ft_puts

section .text

_ft_puts:
	mov rax, rdi		; Save de rdi
	mov rcx, rdi		; Idem
	cmp rdi, 0			; Si rdi est null
	jz parait
	mov r8, 0			; Initialise r8 a 0
	jmp len

len:
	cmp byte[rax], 0	;Taille du len
	jz wri
	inc r8
	inc rax
	jmp len

wri:
	mov rax, 0x2000004	;Prepa pour write
	mov rdi, 1			; FD a 1
	mov	rsi, rcx		; Char a ecrire
	mov	rdx, r8			; taille du write
	syscall

	mov rdi, 1			; FD a 1 again
	mov rdx, 1			; Taille du \n
	mov rax, 0x2000004	;Prepa pour write
	lea rsi, [rel new_line] ;Insere la data new_line (\n)
	syscall
	ret

parait:
	mov rdi, 1						; Ecris le null 
	lea rsi, [rel null_msg]			;
	mov rdx, 7						;
	mov rax, 0x2000004				;
	syscall
	ret

section .data
	null_msg db "(null)",  10
	new_line db  10
