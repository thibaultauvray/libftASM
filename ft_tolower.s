# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_tolower.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/12 11:52:08 by tauvray           #+#    #+#              #
#    Updated: 2015/03/12 11:56:01 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global _ft_tolower

section .text

_ft_tolower:
	mov rax, rdi
	cmp rdi, 65
	jl end
	cmp rdi, 90
	jle y
	cmp rdi, 90
	jg end

y:
	add rax, 32
	jmp end

end:
	ret


