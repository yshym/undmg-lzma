OUT=undmg
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
LIB=-lz -lc -lbz2
CC=cc -c
LD=cc
PREFIX=/usr/local
TARGET=$(PREFIX)/bin/$(OUT)

$(OUT): $(OBJ)
	$(LD) $(LIB) $^ -o $@

install: $(TARGET)

$(TARGET): $(OUT)
	mkdir -p $(PREFIX)/bin/
	install $(OUT) $(PREFIX)/bin/

%.o: %.c
	$(CC) $^ -o $@

clean:
	rm -f $(OBJ) $(OUT)
