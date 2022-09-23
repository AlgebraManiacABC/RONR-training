#The start of any good program is its Makefile! -Luke
NAME=ronr
CC=gcc
CFLAGS=-Wall -Werror -std=c17

SRC_DIR=src
LIB_DIR=lib
OBJ_DIR=build

CFLAGS += -I$(LIB_DIR)

SRCS=$(wildcard $(SRC_DIR)/*.c)
#All .c files in SRC_DIR
OBJ_BASE=$(SRCS:%.c=%.o)
#Replace .c with .o in SRCS
OBJS=$(OBJ_BASE:$(SRC_DIR)%=$(OBJ_DIR)%)
#Replace SRC_DIR with OBJ_DIR in OBJ_BASE(above)
#Gets all SRC_DIR/*.c files and turns them into OBJ_DIR/*.o files

$(NAME): $(OBJS)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(LIBS) | $(OBJ_DIR)
	$(CC) -o $@ -c $^ $(CFLAGS)

$(OBJ_DIR):
	mkdir -p $@

.PHONY: clean

clean:
	rm -rf $(OBJ_DIR)
	rm -f $(NAME)