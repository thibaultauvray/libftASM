# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalpha.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/12 11:44:51 by tauvray           #+#    #+#              #
#    Updated: 2015/03/12 11:48:46 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	_ft_isalpha

section .text

_ft_isalpha:
	cmp rdi, 65
	jl no
	cmp rdi, 90
	jle y
	cmp rdi, 97
	jl no
	cmp rdi, 122
	jle y
	cmp rdi, 122
	jg no

no:
	mov rax, 0
	jmp end

y:
	mov rax, 1
	jmp end

end:
	ret
