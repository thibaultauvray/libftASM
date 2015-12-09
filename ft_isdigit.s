# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    test.s                                             :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/11 18:30:59 by tauvray           #+#    #+#              #
#    Updated: 2015/03/11 18:38:50 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

global	_ft_isdigit

section .text

_ft_isdigit:
	cmp rdi, 48
	jl no
	cmp rdi, 57
	jg no
	jmp y

no:
	mov rax, 0
	jmp end

y:
	mov rax, 1
	jmp end

end:
	ret
