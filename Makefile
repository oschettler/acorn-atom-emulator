
CC		=	gcc
#CFLAGS		=	-c -O6
INCLUDE		=	/usr/X11/include/
CFLAGS		=	-g -Wall -I$(INCLUDE) -DGNU_C -O0
LD		=	gcc
LDFLAGS		=
LDLIBS		=	-lX11

INCLUDES	=	system.h \
			cpu.h \
			atom.h \
			monitor.h \
			keyboard.h \
			file.h \
			screen.h

SRC		=	main.c \
			atom.c \
			cpu.c \
			monitor.c \
			screen.c \
			keyboard.c \
			file.c

OBJS		= 	$(SRC:.c=.o)

MAKEDEPEND      = makedepend

.SUFFIXES: .c 

.c.o:
	$(CC) $(CFLAGS) -c $<


all		: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) $(LDLIBS) -o atom

pack:
	tar -cvf atom.tar *.c *.h Makefile
	gzip atom.tar

depend: $(SRC)
	@echo -n "Doing a makedepend ..";$(MAKEDEPEND) -I$(INCLUDE) $(SRC);echo

# DO NOT DELETE THIS LINE -- make depend depends on it.

main.o: system.h cpu.h atom.h screen.h keyboard.h monitor.h
atom.o: system.h cpu.h atom.h screen.h
cpu.o: system.h atom.h monitor.h cpu.h
monitor.o: system.h atom.h cpu.h monitor.h file.h
screen.o: system.h cpu.h screen.h keyboard.h atom.h
keyboard.o: system.h cpu.h atom.h keyboard.h
file.o: system.h atom.h cpu.h monitor.h file.h
