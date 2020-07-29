OUT=undmg
SRC=$(wildcard *.c)
OBJ=$(SRC:.c=.o)
LIB=-lz -lc -lbz2
CC ?= cc
LD ?= $(CC)
PREFIX=/usr/local
TARGET=$(PREFIX)/bin/$(OUT)
LDFLAGS=
CFLAGS=

.PHONY: all
all: $(OUT)

$(OUT): $(OBJ)
	$(LD) $(LDFLAGS) $(LIB) $^ -o $@

.PHONY: install
install: $(TARGET)

$(TARGET): $(OUT)
	mkdir -p $(PREFIX)/bin/
	install $(OUT) $(PREFIX)/bin/

%.o: %.c
	$(CC) -c $(CFLAGS) $^ -o $@

.PHONY: clean
clean:
	rm -f $(OBJ) $(OUT)
