# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_bzero.s                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/12 14:06:50 by tauvray           #+#    #+#              #
#    Updated: 2015/03/18 13:16:11 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	_ft_bzero

section .text

_ft_bzero:
	mov rax, rsi			; save de lint
	mov rbx, rdi			; save du void
	jmp boucle_zero

boucle_zero:
	cmp rax, 0				; si cest egale a 0 cest finis
	jz end
	mov byte[rbx], 0		; met le byte 0 du void
	dec rax					; Decremente le compteur
	inc rbx					; Inceremente de 1 la chaine dapres
	jmp boucle_zero

end:
	ret

