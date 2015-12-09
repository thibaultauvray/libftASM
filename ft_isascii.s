# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ft_isascii.s                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tauvray <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2015/03/12 11:19:26 by tauvray           #+#    #+#              #
#    Updated: 2015/03/12 11:36:27 by tauvray          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


global	_ft_isascii

section .text

_ft_isascii:
	cmp rdi, 127
	jle y
	jmp no

no:
	mov rax, 0
	jmp end

y:
	mov rax, 1
	jmp end

end:
	ret
