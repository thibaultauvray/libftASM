section .text				; rdi rsi rdx
	global _ft_memcpy

_ft_memcpy:
	push rdi			; Save de rdi
	mov rcx, rdx		; Prepa pour repnz
	cld
	repnz movsb			; copie RDI dans RSI
	jmp	end

end:
	pop rax				; renvoie rdi
	ret
