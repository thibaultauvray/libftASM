# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strcat.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/12 15:58:31 by tauvray           #+#    #+#              #
#    Updated: 2015/03/19 16:20:13 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_strcat

section .text

_ft_strcat:
	mov r8, 0
	mov r9, 0
	jmp end_rdi

end_rdi:
	cmp byte[rdi + r8], 0		; Calcul Du strlen de r8
	jz end_rsi
	inc r8
	jmp end_rdi

end_rsi:
	cmp byte[rsi + r9], 0
	jz end
	mov rcx, [rsi + r9]			; Copie un caractere de rsi 
	mov [rdi + r8], rcx			; Met a la suite le caractere enregistre
	inc r9
	inc r8
	jmp end_rsi

end:
	mov [rdi + r8], byte 0		; \0
	mov rax, rdi
	ret
