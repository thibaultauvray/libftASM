NAME = libfts.a

FLAGS = -f macho64

CC = ~/.brew/bin/nasm $(FLAGS)

SRC = 	ft_bzero.s		\
		ft_strcat.s	\
		ft_isalpha.s	\
		ft_isdigit.s	\
		ft_isalnum.s	\
		ft_isascii.s	\
		ft_isprint.s	\
		ft_toupper.s	\
		ft_tolower.s	\
		ft_puts.s		\
		ft_strlen.s	\
		ft_memset.s	\
		ft_memcpy.s	\
		ft_strdup.s	\
		ft_cat.s		\

OBJ = $(SRC:.s=.o)

all : $(NAME)

$(NAME): $(OBJ)
	ar rcs $(NAME) $(OBJ)
	ranlib $(NAME)

%.o: %.s
	$(CC) -o $@ $< 

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

re: fclean all

.PHONY: all clean fclean re


