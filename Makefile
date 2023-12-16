NAME = test.a

OBJ_DIR = obj
SRC_DIR = src
INC_DIR = include
MAIN_SRC = main.c

SRC_FILES = window.c
CC = cc
CFLAGS = -Wall -Werror -Wextra

SRC = $(addprefix $(SRC_DIR)/, $(SRC_FILES))
OBJ = $(addprefix $(OBJ_DIR)/, $(notdir $(SRC:.c=.o)))

PROGRAM = mlx

all: $(NAME)

$(NAME): $(OBJ_DIR) $(OBJ)
	ar -crs $(NAME) $(OBJ)

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME)

re: fclean all

program: $(MAIN_SRC) $(NAME)
	$(CC) $(CFLAGS) -I./minilibx-linux -L./minilibx-linux -o $(PROGRAM) $(MAIN_SRC) $(NAME) -lmlx -lXext -lX11 -lm -lz
	@echo "\n\nExecuting $(PROGRAM)!\n"
	@./$(PROGRAM)

val: $(MAIN_SRC) $(NAME)
	$(CC) $(CFLAGS) -I./minilibx-linux -L./minilibx-linux -g -o $(PROGRAM) $(MAIN_SRC) $(NAME) -lmlx -lXext -lX11 -lm -lz
	@echo "\n\nExecuting $(PROGRAM) with valgrind!\n"
	@valgrind ./$(PROGRAM)

show: $(MAIN_SRC) $(NAME)
	$(CC) $(CFLAGS) -I./minilibx-linux -L./minilibx-linux -g -o $(PROGRAM) $(MAIN_SRC) $(NAME) -lmlx -lXext -lX11 -lm -lz
	@echo "\n\nExecuting $(PROGRAM) with valgrind!\n"
	@valgrind --leak-check=full --show-leak-kinds=all ./$(PROGRAM)

.PHONY: all clean fclean re program val show
