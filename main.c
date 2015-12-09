/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: tauvray <marvin@42.fr>                     +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2015/03/11 18:39:09 by tauvray           #+#    #+#             */
/*   Updated: 2015/03/19 17:12:53 by tauvray          ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <fcntl.h>
   #include <sys/types.h>
     #include <sys/uio.h>
     #include <unistd.h>

int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_isalpha(int c);
int		ft_tolower(int c);
int		ft_strlen(char *av);
void	*ft_memset(void *b, int c, size_t len);
int		ft_toupper(int c);
void	*ft_memcpy(void *dst, const void *src, size_t n);
char	*ft_strdup(const char *str);
void	ft_cat(int fd);

void	ft_bzero(void *s, size_t n);
char 	*ft_strcat(char *s1, const char *s2);
void	ft_puts(char *s1);
int		get_next_line(int const fd, char **line);

void	test_puts(void)
{
	ft_puts(NULL);
	printf("\033[32mft_puts : \033[m \n");
	ft_puts("Bonjour, je suis un test moche parce que je sais pas comment faire un jolie test de puts");
	printf("\033[32mputs\n\033[m");
	puts("Bonjour, je suis un test moche parce que je sais pas comment faire un jolie test de puts");
}

void	test_strdup(void)
{
	char	*s1;
	char	*s2;
	int		ret;


	ret = 0;
	s1 = ft_strdup("Je suis un test");
	s2 = strdup("Je suis un test");
	if (strcmp(s1, s2) != 0)
		ret = 1;
	free(s1);
	free(s2);

	s1 = ft_strdup("Hello World");
	s2 = strdup("Hello World");
	if (strcmp(s1, s2) != 0)
		ret = 2;

	if (ret == 0)
		printf("\033[32mft_strdup : OK\n\033[m");
	else
		printf("\033[31mft_strdup : KO Failed at cpt = %i \033[m", ret);
}

void	test_memcpy(void)
{
	char	test[100];
	char	test1[100];
	char	real[100];
	char	real1[100];
	int		ret;

	ret = 0;
	memset(test, 33, 100), memset(test1, 63, 100);
	memset(real, 33, 100), memset(real1, 63, 100);
	ft_memcpy(test, test1, 50);
	memcpy(real, real1, 50);
	if (memcmp(test, real, 100) != 0)
		ret = 1;

	ft_memcpy(test, "Bonjour", 8);
   	memcpy(real, "Bonjour", 8);
	if (memcmp(test, real, 100) != 0)
		ret = 2;
	ft_memcpy(test, test1, 100);
	if (memcmp(test, test1, 100) != 0)
		ret = 3;
	if (ret == 0)
		printf("\033[32mft_memcpy : OK\n\033[m");
	else
		printf("\033[31mft_memcpy : KO Failed at cpt = %i \033[m", ret);
}


void	test_strlen(void)
{
	int	i;
	int	j;
	int	ret;

	ret = 0;
	i = strlen("ABCDEFGGHKFHLGKFHLFGLKHFLGHKFGLHK");
	j = ft_strlen("ABCDEFGGHKFHLGKFHLFGLKHFLGHKFGLHK");
	if (i != j)
		ret = 1;

	i = strlen("Encore un petit test");
	j = ft_strlen("Encore un petit test");
	if (i != j)
		ret = 2;

	i = strlen("");
	j = ft_strlen("");
	if (i != j)
		ret = 3;

	i = strlen("Et hop");
	j = ft_strlen("Et hop");
	if (i != j)
		ret = 4;

	if (ret == 0)
		printf("\033[32mft_strlen : OK\n\033[m");
	else
		printf("\033[31mft_strlen : KO Failed at cpt = %i \033[m", ret);


}

void	test_memset(void)
{
	char	*s1;
	char	*s2;
	int		ret;

	ret = 0;
	if (!(s1 = (char *)malloc(sizeof(char) * 10 * 1000)))
		return ;
	if (!(s2 = (char *)malloc(sizeof(char) * 10 * 1000)))
		return ;
	memset(s1, '0', 10 * 1000);
	ft_memset(s2, '0', 10 * 1000);
	if (memcmp(s1, s2, 10 * 1000) != 0)
		ret = 1;
	free(s1);
	free(s2);
	s1 = strdup("abcdef");
	s2 = strdup("abcdef");
	memset(s1, 1000, 3);
	memset(s2, 1000, 3);
	if (memcmp(s1, s2, 7) != 0)
		ret = 2;
	free(s1);
	free(s2);
	s1 = strdup("abcdef");
	s2 = strdup("abcdef");
	memset(s1, '1', 0);
	memset(s2, '1', 0);
	if (memcmp(s1, s2, 7) != 0)
		ret = 3;
	if (ret == 0)
		printf("\033[32mft_memset : OK\n\033[m");
	else
		printf("\033[31mft_memset : KO Failed at cpt = %i \033[m", ret);


}

void	test_strcat(void)
{
	int	ret;

	ret = 0;
	char src[50], dest[50];
	char src1[50], dest1[50];
	strcpy(src,  "ABCDEFGHIJKL");
	strcpy(dest, "abcdefghijkl");
	strcpy(src1,  "ABCDEFGHIJKL");
	strcpy(dest1, "abcdefghijkl");
	ft_strcat(dest, src);
	strcat(dest1, src1);
	if (strcmp (dest, dest1) != 0 && strcmp (src, src1) != 0)
		ret = 1;

	char src2[50], dest2[50];
	char src3[50], dest3[50];
	strcpy(src2,  "Je suis un test genial");
	strcpy(dest2, "Il paraitijkl");
	strcpy(src3,  "Je suis un test genial");
	strcpy(dest3, "Il paraitijkl");
	ft_strcat(dest2, src2);
	strcat(dest3, src3);
	if (strcmp (dest2, dest3) != 0 && strcmp (src2, src3) != 0)
		ret = 1;
	if (ret == 0)
		printf("\033[32mft_strcat : OK\n\033[m");
	else
		printf("\033[31mft_strcat : KO Failed at cpt = %i \033[m", ret);
}

void	test_bzero(void)
{
	int		ret;
	char	s1[] = "jsuis";
	char	s2[] = "jsuis";

	ret = 0;
	bzero(s1, 7);
	ft_bzero(s2, 7);
	if ( memcmp(s1, s2, 3) != 0)
		ret = 1;

	char	s3[] = "1234567890";
	char	s4[] = "1234567890";
	bzero(s3, 10);
	ft_bzero(s4, 10);
	if ( memcmp(s3, s4, 10) != 0)
		ret = 1;

	char	s5[] = "1234567890";
	char	s6[] = "1234567890";
	bzero(s5, 0);
	ft_bzero(s6, 0);
	if ( memcmp(s5, s6, 10) != 0)
		ret = 1;

	if (ret == 0)
		printf("\033[32mft_bzero : OK\n\033[m");
	else
		printf("\033[31mft_bzero : KO Failed at cpt = %i \033[m", ret);

}

void	test_tolower(void)
{
	int	i;
	int	j;
	int	cpt;
	int	ret;

	cpt = 0;
	ret = 0;
	while (cpt != 300)
	{
		i = toupper(cpt);
		j = ft_toupper(cpt);
		if (i != j)
		{
			ret = cpt;
			printf("Failed at cpt = %i\n", cpt);
		}
		cpt++;
	}
	if (ret == 0)
		printf("\033[32mft_tolower : OK\n\033[m");
	else
		printf("\033[31mft_tolower : KO Failed at cpt = %i \033[m", ret);
}

void	test_toupper(void)
{
	int	i;
	int	j;
	int	cpt;
	int	ret;

	cpt = 0;
	ret = 0;
	while (cpt != 300)
	{
		i = tolower(cpt);
		j = ft_tolower(cpt);
		if (i != j)
		{
			ret = cpt;
			printf("Failed at cpt = %i\n", cpt);
		}
		cpt++;
	}
	if (ret == 0)
		printf("\033[32mft_toupper : OK\n\033[m");
	else
		printf("\033[31mft_toupper : KO Failed at cpt = %i \033[m", ret);
}

void	test_isalpha(void)
{
	int	i;
	int	j;
	int	cpt;
	int	ret;

	cpt = 0;
	ret = 0;
	while (cpt != 300)
	{
		i = isalpha(cpt);
		j = ft_isalpha(cpt);
		if (i != j)
		{
			ret = cpt;
			printf("Failed at cpt = %i\n", cpt);
		}
		cpt++;
	}
	if (ret == 0)
		printf("\033[32mft_isalpha : OK\n\033[m");
	else
		printf("\033[31mft_isalpha : KO Failed at cpt = %i \033[m", ret);
}

void	test_isprint(void)
{
	int	i;
	int	j;
	int	cpt;
	int	ret;

	cpt = 0;
	ret = 0;
	while (cpt != 300)
	{
		i = isprint(cpt);
		j = ft_isprint(cpt);
		if (i != j)
		{
			ret = cpt;
			printf("Failed at cpt = %i\n", cpt);
		}
		cpt++;
	}
	if (ret == 0)
		printf("\033[32mft_isprint : OK\n\033[m");
	else
		printf("\033[31mft_isprint : KO Failed at cpt = %i \033[m", ret);
}

void	test_isascii(void)
{
	int	i;
	int	j;
	int	cpt;
	int	ret;

	cpt = 0;
	ret = 0;
	while (cpt != 300)
	{
		i = isdigit(cpt);
		j = ft_isdigit(cpt);
		if (i != j)
		{
			ret = cpt;
		}
		cpt++;
	}
	if (ret == 0)
		printf("\033[32mft_isascii : OK\n\033[m");
	else
		printf("\033[31mft_isascii : KO Failed at cpt = %i \033[m", ret);
}

void	test_isalnum(void)
{
	int	i;
	int	j;
	int	cpt;
	int	ret;

	cpt = 0;
	ret = 0;
	while (cpt != 300)
	{
		i = isalnum(cpt);
		j = ft_isalnum(cpt);
		if (i != j)
		{
			ret = cpt;
			printf("Failed at cpt = %i\n", cpt);
		}
		cpt++;
	}
	if (ret == 0)
		printf("\033[32mft_isalnum : OK\n\033[m");
	else
		printf("\033[31mft_isalnum : KO Failed at cpt = %i \033[m", ret);
}

void	test_isdigit(void)
{
	int	i;
	int	j;
	int	cpt;
	int	ret;

	cpt = 0;
	ret = 0;
	while (cpt != 300)
	{
		i = isdigit(cpt);
		j = ft_isdigit(cpt);
		if (i != j)
		{
			ret = cpt;
			printf("Failed at cpt = %i\n", cpt);
		}
		cpt++;
	}
	if (ret == 0)
		printf("\033[32mft_isdigit : OK\n\033[m");
	else
		printf("\033[31mft_isdigit : KO Failed at cpt = %i \033[m", ret);
}

void	test_cat(void)
{
	int		fd;

	printf("\033[32mFT_CAT : ft_cat de cats \033[m\n");
	fd = open("ft_cat.s", O_RDONLY);
	ft_cat(fd);

	printf("\033[32mFT_CAT : ft_cat d'un FD null \033[m\n");
	fd = open("ft_catwewqewq.s", O_RDONLY);
	ft_cat(fd);
}

int		main(void)
{
	printf("================ PART 1 ===========\n");
	test_isdigit();
	test_isalnum();
	test_isascii();
	test_isprint();
	test_isalpha();
	test_tolower();
	test_toupper();
	test_bzero();
	test_strcat();
	test_puts();

	printf("================ PART 2 ===========\n");
	test_strlen();
	test_memset();
	test_memcpy();
	test_strdup();

	printf("================ PART 3 ===========\n");
	test_cat();
}
