# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: iverniho <iverniho@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/24 16:25:12 by iverniho          #+#    #+#              #
#    Updated: 2024/04/29 12:57:44 by iverniho         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CC = cc

NAME_C = cleint
NAME_S = server
SRC_C = client.c
SRC_S = server.c
OBJ_C = ${SRC_C:.c=.o}
OBJ_S = ${SRC_S:.c=.o}
CFLAGS = -Wall -Wextra -Werror

all: $(NAMEC) $(NAMES)

$(NAMEC): $(OBJ_C)
	$(CC) -g $(CFLAGS) $(OBJ_C) -o $(NAME_C)

$(NAMES): $(OBJ_S)
	$(CC) -g $(CFLAGS) $(OBJ_S) -o $(NAME_S)

clean:
	rm -rf $(OBJ_C)
	rm -rf $(OBJ_S)

fclean: clean
	rm -f $(NAME_C)
	rm -f $(NAME_S)

re: fclean all

.PHONY: all clean fclean re
