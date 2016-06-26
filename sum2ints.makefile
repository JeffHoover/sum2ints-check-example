CFLAGS=-Wall
LIBS=-lcheck

all: sum2ints

sum2ints: main.o implementation.o
	gcc -o sum2ints main.o implementation.o

main.o: main.c implementation.h
	gcc $(CFLAGS) -c main.c

implementation.o: implementation.c implementation.h
	gcc $(CFLAGS) -c implementation.c

test: sum2ints-test
	./sum2ints-test

sum2ints-test: implementation-test.o implementation.o
	gcc -o sum2ints-test implementation.o implementation-test.o $(LIBS)

implementation-test.o: implementation-test.c implementation.h
	gcc $(CFLAGS) -c implementation-test.c

implementation-test.c: implementation-test.check
	~/checkmk implementation-test.check >implementation-test.c