# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isprint.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/12 11:43:04 by tauvray           #+#    #+#              #
#    Updated: 2015/03/12 11:43:07 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	_ft_isprint

section .text

_ft_isprint:
	cmp rdi, 32
	jl no
	cmp rdi, 126
	jle y
	cmp rdi, 126
	jg no

no:
	mov rax, 0
	jmp end

y:
	mov rax, 1
	jmp end

end:
	ret
