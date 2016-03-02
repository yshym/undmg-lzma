OUT=undmg
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
LIB=-lz -lc -lbz2
CC=cc -c
LD=clang
LD_FLAGS=$(LIB)
CC_FLAGS=

$(OUT): $(OBJ)
	$(LD) $(LD_FLAGS) $^ -o $@

%.o: %.c
	$(CC) $(CC_FLAGS) $^ -o $@

clean:
	rm -f $(OBJ) $(OUT)
