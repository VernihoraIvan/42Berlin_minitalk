# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iverniho <iverniho@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/24 16:25:12 by iverniho          #+#    #+#              #
#    Updated: 2024/04/29 17:15:52 by iverniho         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc

NAME_C = client
NAME_S = server
SRC_C = client.c
SRC_S = server.c
OBJ_C = ${SRC_C:.c=.o}
OBJ_S = ${SRC_S:.c=.o}
CFLAGS = -Wall -Wextra -Werror
RM = rm -f
RF = rm -rf

all: $(NAME_C) $(NAME_S)

$(NAME_C): $(OBJ_C)
	@$(CC) $(CFLAGS) $(OBJ_C) -o $(NAME_C)

$(NAME_S): $(OBJ_S)
	@$(CC) $(CFLAGS) $(OBJ_S) -o $(NAME_S)

clean:
	$(RF) $(OBJ_C)
	$(RF) $(OBJ_S)

fclean: clean
	$(RM) $(NAME_C)
	$(RM) $(NAME_S)

re: fclean all

.PHONY: all clean fclean re
