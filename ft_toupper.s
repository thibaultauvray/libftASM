# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_toupper.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/12 11:56:54 by tauvray           #+#    #+#              #
#    Updated: 2015/03/12 11:57:15 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


global _ft_toupper

section .text

_ft_toupper:
	mov rax, rdi
	cmp rdi, 97
	jl end
	cmp rdi, 122
	jle y
	cmp rdi, 122
	jg end

y:
	sub rax, 32
	jmp end

end:
	ret


