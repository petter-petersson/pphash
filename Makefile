-include config.mk

LDFLAGS=-L.
LIBS=-lpphash
CFLAGS+=-std=c99 -D_GNU_SOURCE

all: libpphash.a 

libpphash.a: pphash.o
	$(AR) rc $@ $^

%.o: %.c pphash.h
	$(CC) -c $(CFLAGS) $< -o $@

test: pphash_test
	./pphash_test

pphash_test: pphash-tests.o libpphash.a
	$(CC) $(CFLAGS) $^ -o $@ $(LDFLAGS) $(LIBS)

#pphash-tests.o: pphash-tests.c libpphash.a

clean:
	rm -rf *.o *.a pphash_test

.PHONY: all clean test

