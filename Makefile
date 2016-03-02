OUT=undmg
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
LIB=-lz -lc -lbz2
CC=cc -c
LD=cc

$(OUT): $(OBJ)
	$(LD) $(LIB) $^ -o $@

%.o: %.c
	$(CC) $^ -o $@

clean:
	rm -f $(OBJ) $(OUT)
