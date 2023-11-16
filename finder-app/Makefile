ifeq ($(CROSS_COMPILE),)
	CC=gcc
else
	CC=$(CROSS_COMPILE)gcc
endif

default: writer.c
	$(CC) writer.c -o writer

clean:
	rm -f writer
	rm -f *.o