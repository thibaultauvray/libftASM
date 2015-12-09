# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isalnum.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/11 19:40:26 by tauvray           #+#    #+#              #
#    Updated: 2015/03/18 13:13:29 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	_ft_isalnum

section .text

_ft_isalnum:
	cmp rdi, 48			
	jl no
	cmp rdi, 57
	jle y
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
