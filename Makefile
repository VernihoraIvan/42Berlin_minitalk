# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iverniho <iverniho@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/24 16:25:12 by iverniho          #+#    #+#              #
#    Updated: 2024/05/02 12:52:41 by iverniho         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc

NAME_C = client
NAME_S = server
NAME_BONUS_C = client_bonus
NAME_BONUS_S = server_bonus
SRC_C = client.c
SRC_S = server.c
SRC_BONUS_C = client_bonus.c
SRC_BONUS_S = server_bonus.c
OBJ_C = ${SRC_C:.c=.o}
OBJ_S = ${SRC_S:.c=.o}
OBJ_BONUS_C = ${SRC_BONUS_C:.c=.o}
OBJ_BONUS_S = ${SRC_BONUS_S:.c=.o}
CFLAGS = -Wall -Wextra -Werror -O3
RM = rm -f
RF = rm -rf

all: $(NAME_C) $(NAME_S)

$(NAME_C): $(OBJ_C)
	@$(CC) $(CFLAGS) $(OBJ_C) -o $(NAME_C)

$(NAME_S): $(OBJ_S)
	@$(CC) $(CFLAGS) $(OBJ_S) -o $(NAME_S)

bonus: $(NAME_BONUS_C) $(NAME_BONUS_S)

$(NAME_BONUS_C): $(OBJ_BONUS_C)
	@$(CC) $(CFLAGS) $(OBJ_BONUS_C) -o $(NAME_BONUS_C)

$(NAME_BONUS_S): $(OBJ_BONUS_S)
	@$(CC) $(CFLAGS) $(OBJ_BONUS_S) -o $(NAME_BONUS_S)

clean:
	$(RF) $(OBJ_C)
	$(RF) $(OBJ_S)
	$(RF) $(OBJ_BONUS_C)
	$(RF) $(OBJ_BONUS_S)

fclean: clean
	$(RM) $(NAME_C)
	$(RM) $(NAME_S)
	$(RM) $(NAME_BONUS_C)
	$(RM) $(NAME_BONUS_S)

re: fclean all

.PHONY: all clean fclean re
