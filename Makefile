# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tbeguin <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/12/06 00:42:12 by tbeguin           #+#    #+#              #
#    Updated: 2018/12/06 03:09:10 by tbeguin          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = gnl.out

CC = gcc

CFLAGS = -Wall -Wextra -Werror

SRCS = get_next_line.c

OBJS = $(SRCS:.c=.o)

LIBFT = libft/libft.a

all : $(NAME)

$(OBJS) : %.o:%.c
	@$(CC) -c $(CFLAGS) $< -o $@

$(NAME) :$(OBJS)
	@make -C libft
	@gcc $(OBJS) $(LIBFT) -o $(NAME)
	@echo "\033[32mCompiled Executable\033[0m"

clean :
	@rm -rf $(OBJS)
	@make -C libft clean
	@echo "\033[35mRemoved Object Files\033[0m"

fclean : clean
	@rm -rf $(NAME)
	@make -C libft fclean
	@echo "\033[31mRemoved Executable\033[0m"

re : fclean all
