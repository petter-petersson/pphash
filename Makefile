-include config.mk

LDFLAGS=-L.
LIBS=-lpphash

all: libpphash.a 

libpphash.a: pphash.o
	$(AR) rc $@ $^

%.o: %.c pphash.h
	$(CC) -c $(CFLAGS) $< -o $@

test: pphash_test
	./pphash_test

pphash_test: pphash-tests.o
	$(CC) $(CFLAGS) $(LDFLAGS) $(LIBS) $< -o $@

pphash-tests.o: pphash-tests.c libpphash.a

clean:
	rm -rf *.o *.a pphash_test

.PHONY: all clean test

