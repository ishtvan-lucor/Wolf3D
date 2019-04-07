#******************************************************************************#
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ikoloshy <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2018/04/11 15:27:53 by ikoloshy          #+#    #+#              #
#    Updated: 2019/04/07 17:50:18 by ikoloshy         ###   ########.fr        #
#                                                                              #
#******************************************************************************#

NAME = wolf3d
FLG = -Wall -Wextra -Werror
FRM = -framework AppKit -framework OpenGL
SRC = 

HDR = includes/
OFL = $(SRC:.c=.o)
LIB = libft/libft.a
MLX = -lmlx -I minilibx_macos -L minilibx_macos

.NOTPARALLEL: all clean fclean re

.PHONY: all clean fclean re

all: $(NAME)

$(NAME): $(LIB) $(OFL) 
	@gcc $(FLG) -o $@ $(OFL) -I $(HDR) -L libft/ -lft $(MLX) $(FRM)
	@echo "\033[1;32mRTv1 is ready to work\033[0m"

%.o: %.c $(HDR) $(LIB)
	@gcc -c $< -o $@ $(FLG)
$(LIB):
	@make -C ./libft

clean:
	@/bin/rm -f $(OFL)
	@make fclean -C ./libft
	@echo "\033[1;32mObjects files RTv1 were deleted\033[0m"

fclean: clean
	@/bin/rm -f $(NAME)
	@echo "\033[1;32mRTv1 was deleted\033[0m"

re: fclean all
