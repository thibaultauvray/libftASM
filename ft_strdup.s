global _ft_strdup

section .text
	extern _malloc
	extern _ft_memcpy
	extern _ft_strlen

_ft_strdup:
	mov r13, rdi		; Copie du parametre
	call _ft_strlen		; Appel de strlen, met la taille de strlen dans RAX

	mov r14, rax		; Copie de ft_strlen
	mov rdi, rax		; Preparation pour le malloc, met la taille 
	inc rdi				; Pour le \0
	call _malloc		; Appel de malloc (captain obvious)

	cmp rax, 0			; Si malloc a foire finir
	je end
	mov		[rax + r14], byte 0	 ; \0
	mov rdi, rax		; Preparation de memcpy, rdi = adresse du premier caractere malloc
	mov rsi, r13		; rsi = char a envoyer dans le memcpy
	mov rdx, r14		; taille du memccpy (taille de la chaine)
	call _ft_memcpy		; Captain Obvious

end:
	ret
