# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_memset.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/16 16:13:25 by tauvray           #+#    #+#              #
#    Updated: 2015/03/18 13:21:54 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_memset

_ft_memset:
	push rdi		; copie de RDI
	mov rax, rsi	; Caractere a copier
	mov rcx, rdx	;Longueur du memset
	push rdx
	rep stosb		; Cest magique sa fais tout tout seul

end:
	pop rdx
	pop rdi
	mov rax, rdi
	ret
