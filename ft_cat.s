global	_ft_cat					; ft_chat (LOL)


_ft_cat:

.read:
	mov rax, 0x2000003 			; appel de read
	push rdi					; Sauvegarde de rdi 
	lea rsi, [rel buff_size]	; Buffer
	mov rdx, buffsize			; buffsize
	syscall						; Syscall de read
	jc err						; Si read a foire aller a err
	cmp rax, 0					; Si le buffer est vide donc plus rien a lire terminer
	je end				
	mov rax, 0x2000004			; Write
	mov rdi, 1					; FD
	mov rdx, buffsize			; buffsize
	syscall						; Syscall de write
	jc err						; Si par magie, write bug
	pop rdi						; On remet RDI pour le read
	jmp .read

err:
	pop rdi						;Vidage de stack
	ret

end:
	pop rdi
	ret

section .data
	buff_size db 100
	buffsize equ $ - buff_size

