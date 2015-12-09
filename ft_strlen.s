# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_strlen.s                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/16 16:13:22 by tauvray           #+#    #+#              #
#    Updated: 2015/03/19 15:01:37 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

section .text
	global _ft_strlen

_ft_strlen:
	mov	rsi, rdi
	mov rax, 0
	mov rcx, -1
	cld
	repnz scasb
	mov rax, -2
	sub rax, rcx

end:
	ret
