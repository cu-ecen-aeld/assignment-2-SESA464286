# GCC Makefile for the finder application
# Make could be used to build native or cross-compiled applications
CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Wextra -O3

default:
	$(CC) $(CFLAGS) -o writer writer.c

clean:
	rm -f writer
