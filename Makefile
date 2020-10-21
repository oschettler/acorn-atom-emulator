
#CC		=	gcc
CXX          =   g++
#CFLAGS		=	-c -O6
INCLUDE		=	/usr/X11/include/
#CFLAGS		=	-g -Wall -I$(INCLUDE) -DGNU_C -DHOST_X11 -O0
CPPFLAGS	=	-g -Wall -DGNU_C -DHOST_SFML -DDEBUG -O0
#LD		=	gcc
LD		    =	g++
LDFLAGS		=
#LDLIBS		=	-lX11
LDLIBS      =   -lsfml-graphics -lsfml-window -lsfml-system
INCLUDES	=	system.h \
			cpu.h \
			atom.h \
			monitor.h \
			keyboard.h \
			file.h \
			screen.h

SRC		=	main.cpp \
			atom.cpp \
			cpu.cpp \
			monitor.cpp \
			screen_x11.cpp \
			screen_sfml.cpp \
			keyboard_x11.cpp \
			keyboard_sfml.cpp \
			file.cpp

OBJS		= 	$(SRC:.cpp=.o)

MAKEDEPEND      = makedepend

.SUFFIXES: .c 

.c.o:
	$(CC) $(CFLAGS) -c $<


all: $(OBJS)
	$(LD) $(LDFLAGS) $(OBJS) $(LDLIBS) -o atom

clean:
	rm -f *.o atom

gtest: gtest.cpp
	$(CXX) -o gtest $(CPPFLAGS) gtest.cpp $(LDLIBS)

pack:
	tar -cvf atom.tar *.c *.h Makefile
	gzip atom.tar

depend: $(SRC)
	@echo -n "Doing a makedepend ..";$(MAKEDEPEND) -I$(INCLUDE) $(SRC);echo

.PHONY: all clean pack

# DO NOT DELETE THIS LINE -- make depend depends on it.

main.o: /usr/include/stdio.h /usr/include/_stdio.h /usr/include/sys/cdefs.h
main.o: /usr/include/sys/_symbol_aliasing.h
main.o: /usr/include/sys/_posix_availability.h /usr/include/Availability.h
main.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
main.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
main.o: /usr/include/i386/_types.h /usr/include/sys/_pthread/_pthread_types.h
main.o: /usr/include/sys/_types/_va_list.h /usr/include/machine/types.h
main.o: /usr/include/i386/types.h /usr/include/sys/_types/_int8_t.h
main.o: /usr/include/sys/_types/_int16_t.h /usr/include/sys/_types/_int32_t.h
main.o: /usr/include/sys/_types/_int64_t.h
main.o: /usr/include/sys/_types/_u_int8_t.h
main.o: /usr/include/sys/_types/_u_int16_t.h
main.o: /usr/include/sys/_types/_u_int32_t.h
main.o: /usr/include/sys/_types/_u_int64_t.h
main.o: /usr/include/sys/_types/_intptr_t.h
main.o: /usr/include/sys/_types/_uintptr_t.h
main.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_null.h
main.o: /usr/include/sys/stdio.h /usr/include/sys/_types/_off_t.h
main.o: /usr/include/sys/_types/_ssize_t.h /usr/include/secure/_stdio.h
main.o: /usr/include/secure/_common.h /usr/include/stdlib.h
main.o: /usr/include/sys/wait.h /usr/include/sys/_types/_pid_t.h
main.o: /usr/include/sys/_types/_id_t.h /usr/include/sys/signal.h
main.o: /usr/include/sys/appleapiopts.h /usr/include/machine/signal.h
main.o: /usr/include/i386/signal.h /usr/include/machine/_mcontext.h
main.o: /usr/include/i386/_mcontext.h /usr/include/mach/machine/_structs.h
main.o: /usr/include/mach/i386/_structs.h
main.o: /usr/include/sys/_pthread/_pthread_attr_t.h
main.o: /usr/include/sys/_types/_sigaltstack.h
main.o: /usr/include/sys/_types/_ucontext.h
main.o: /usr/include/sys/_types/_sigset_t.h /usr/include/sys/_types/_uid_t.h
main.o: /usr/include/sys/resource.h /usr/include/stdint.h
main.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
main.o: /usr/include/_types/_uint32_t.h /usr/include/_types/_uint64_t.h
main.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
main.o: /usr/include/sys/_types/_timeval.h /usr/include/machine/endian.h
main.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
main.o: /usr/include/libkern/_OSByteOrder.h
main.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
main.o: /usr/include/sys/_types/_ct_rune_t.h
main.o: /usr/include/sys/_types/_rune_t.h /usr/include/sys/_types/_wchar_t.h
main.o: /usr/include/malloc/_malloc.h /usr/include/sys/_types/_dev_t.h
main.o: /usr/include/sys/_types/_mode_t.h /usr/include/string.h
main.o: /usr/include/sys/_types/_rsize_t.h /usr/include/sys/_types/_errno_t.h
main.o: /usr/include/strings.h /usr/include/secure/_strings.h
main.o: /usr/include/secure/_string.h /usr/include/fcntl.h
main.o: /usr/include/sys/fcntl.h /usr/include/sys/_types/_o_sync.h
main.o: /usr/include/sys/_types/_o_dsync.h
main.o: /usr/include/sys/_types/_seek_set.h /usr/include/sys/_types/_s_ifmt.h
main.o: /usr/include/sys/_types/_timespec.h
main.o: /usr/include/sys/_types/_filesec_t.h /usr/include/ctype.h
main.o: /usr/include/_ctype.h /usr/include/runetype.h
main.o: /usr/include/sys/_types/_wint_t.h /usr/include/signal.h
main.o: /usr/include/sys/_pthread/_pthread_t.h /usr/include/unistd.h
main.o: /usr/include/sys/unistd.h /usr/include/sys/_types/_posix_vdisable.h
main.o: /usr/include/sys/_types/_gid_t.h
main.o: /usr/include/sys/_types/_useconds_t.h /usr/include/sys/select.h
main.o: /usr/include/sys/_types/_fd_def.h /usr/include/sys/_types/_time_t.h
main.o: /usr/include/sys/_types/_suseconds_t.h
main.o: /usr/include/sys/_types/_fd_setsize.h
main.o: /usr/include/sys/_types/_fd_set.h /usr/include/sys/_types/_fd_clr.h
main.o: /usr/include/sys/_types/_fd_isset.h
main.o: /usr/include/sys/_types/_fd_zero.h /usr/include/sys/_types/_fd_copy.h
main.o: /usr/include/sys/_select.h /usr/include/sys/_types/_uuid_t.h
main.o: /usr/include/gethostuuid.h system.h cpu.h atom.h screen.h keyboard.h
main.o: monitor.h
atom.o: /usr/include/stdio.h /usr/include/_stdio.h /usr/include/sys/cdefs.h
atom.o: /usr/include/sys/_symbol_aliasing.h
atom.o: /usr/include/sys/_posix_availability.h /usr/include/Availability.h
atom.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
atom.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
atom.o: /usr/include/i386/_types.h /usr/include/sys/_pthread/_pthread_types.h
atom.o: /usr/include/sys/_types/_va_list.h /usr/include/machine/types.h
atom.o: /usr/include/i386/types.h /usr/include/sys/_types/_int8_t.h
atom.o: /usr/include/sys/_types/_int16_t.h /usr/include/sys/_types/_int32_t.h
atom.o: /usr/include/sys/_types/_int64_t.h
atom.o: /usr/include/sys/_types/_u_int8_t.h
atom.o: /usr/include/sys/_types/_u_int16_t.h
atom.o: /usr/include/sys/_types/_u_int32_t.h
atom.o: /usr/include/sys/_types/_u_int64_t.h
atom.o: /usr/include/sys/_types/_intptr_t.h
atom.o: /usr/include/sys/_types/_uintptr_t.h
atom.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_null.h
atom.o: /usr/include/sys/stdio.h /usr/include/sys/_types/_off_t.h
atom.o: /usr/include/sys/_types/_ssize_t.h /usr/include/secure/_stdio.h
atom.o: /usr/include/secure/_common.h system.h cpu.h atom.h keyboard.h
atom.o: screen.h
cpu.o: /usr/include/stdio.h /usr/include/_stdio.h /usr/include/sys/cdefs.h
cpu.o: /usr/include/sys/_symbol_aliasing.h
cpu.o: /usr/include/sys/_posix_availability.h /usr/include/Availability.h
cpu.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
cpu.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
cpu.o: /usr/include/i386/_types.h /usr/include/sys/_pthread/_pthread_types.h
cpu.o: /usr/include/sys/_types/_va_list.h /usr/include/machine/types.h
cpu.o: /usr/include/i386/types.h /usr/include/sys/_types/_int8_t.h
cpu.o: /usr/include/sys/_types/_int16_t.h /usr/include/sys/_types/_int32_t.h
cpu.o: /usr/include/sys/_types/_int64_t.h /usr/include/sys/_types/_u_int8_t.h
cpu.o: /usr/include/sys/_types/_u_int16_t.h
cpu.o: /usr/include/sys/_types/_u_int32_t.h
cpu.o: /usr/include/sys/_types/_u_int64_t.h
cpu.o: /usr/include/sys/_types/_intptr_t.h
cpu.o: /usr/include/sys/_types/_uintptr_t.h /usr/include/sys/_types/_size_t.h
cpu.o: /usr/include/sys/_types/_null.h /usr/include/sys/stdio.h
cpu.o: /usr/include/sys/_types/_off_t.h /usr/include/sys/_types/_ssize_t.h
cpu.o: /usr/include/secure/_stdio.h /usr/include/secure/_common.h
cpu.o: /usr/include/stdlib.h /usr/include/sys/wait.h
cpu.o: /usr/include/sys/_types/_pid_t.h /usr/include/sys/_types/_id_t.h
cpu.o: /usr/include/sys/signal.h /usr/include/sys/appleapiopts.h
cpu.o: /usr/include/machine/signal.h /usr/include/i386/signal.h
cpu.o: /usr/include/machine/_mcontext.h /usr/include/i386/_mcontext.h
cpu.o: /usr/include/mach/machine/_structs.h /usr/include/mach/i386/_structs.h
cpu.o: /usr/include/sys/_pthread/_pthread_attr_t.h
cpu.o: /usr/include/sys/_types/_sigaltstack.h
cpu.o: /usr/include/sys/_types/_ucontext.h
cpu.o: /usr/include/sys/_types/_sigset_t.h /usr/include/sys/_types/_uid_t.h
cpu.o: /usr/include/sys/resource.h /usr/include/stdint.h
cpu.o: /usr/include/_types/_uint8_t.h /usr/include/_types/_uint16_t.h
cpu.o: /usr/include/_types/_uint32_t.h /usr/include/_types/_uint64_t.h
cpu.o: /usr/include/_types/_intmax_t.h /usr/include/_types/_uintmax_t.h
cpu.o: /usr/include/sys/_types/_timeval.h /usr/include/machine/endian.h
cpu.o: /usr/include/i386/endian.h /usr/include/sys/_endian.h
cpu.o: /usr/include/libkern/_OSByteOrder.h
cpu.o: /usr/include/libkern/i386/_OSByteOrder.h /usr/include/alloca.h
cpu.o: /usr/include/sys/_types/_ct_rune_t.h /usr/include/sys/_types/_rune_t.h
cpu.o: /usr/include/sys/_types/_wchar_t.h /usr/include/malloc/_malloc.h
cpu.o: /usr/include/sys/_types/_dev_t.h /usr/include/sys/_types/_mode_t.h
cpu.o: system.h atom.h monitor.h cpu.h
monitor.o: /usr/include/stdio.h /usr/include/_stdio.h
monitor.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
monitor.o: /usr/include/sys/_posix_availability.h /usr/include/Availability.h
monitor.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
monitor.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
monitor.o: /usr/include/i386/_types.h
monitor.o: /usr/include/sys/_pthread/_pthread_types.h
monitor.o: /usr/include/sys/_types/_va_list.h /usr/include/machine/types.h
monitor.o: /usr/include/i386/types.h /usr/include/sys/_types/_int8_t.h
monitor.o: /usr/include/sys/_types/_int16_t.h
monitor.o: /usr/include/sys/_types/_int32_t.h
monitor.o: /usr/include/sys/_types/_int64_t.h
monitor.o: /usr/include/sys/_types/_u_int8_t.h
monitor.o: /usr/include/sys/_types/_u_int16_t.h
monitor.o: /usr/include/sys/_types/_u_int32_t.h
monitor.o: /usr/include/sys/_types/_u_int64_t.h
monitor.o: /usr/include/sys/_types/_intptr_t.h
monitor.o: /usr/include/sys/_types/_uintptr_t.h
monitor.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_null.h
monitor.o: /usr/include/sys/stdio.h /usr/include/sys/_types/_off_t.h
monitor.o: /usr/include/sys/_types/_ssize_t.h /usr/include/secure/_stdio.h
monitor.o: /usr/include/secure/_common.h /usr/include/ctype.h
monitor.o: /usr/include/_ctype.h /usr/include/runetype.h
monitor.o: /usr/include/sys/_types/_ct_rune_t.h
monitor.o: /usr/include/sys/_types/_rune_t.h
monitor.o: /usr/include/sys/_types/_wchar_t.h
monitor.o: /usr/include/sys/_types/_wint_t.h system.h atom.h cpu.h monitor.h
monitor.o: file.h
file.o: /usr/include/stdio.h /usr/include/_stdio.h /usr/include/sys/cdefs.h
file.o: /usr/include/sys/_symbol_aliasing.h
file.o: /usr/include/sys/_posix_availability.h /usr/include/Availability.h
file.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
file.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
file.o: /usr/include/i386/_types.h /usr/include/sys/_pthread/_pthread_types.h
file.o: /usr/include/sys/_types/_va_list.h /usr/include/machine/types.h
file.o: /usr/include/i386/types.h /usr/include/sys/_types/_int8_t.h
file.o: /usr/include/sys/_types/_int16_t.h /usr/include/sys/_types/_int32_t.h
file.o: /usr/include/sys/_types/_int64_t.h
file.o: /usr/include/sys/_types/_u_int8_t.h
file.o: /usr/include/sys/_types/_u_int16_t.h
file.o: /usr/include/sys/_types/_u_int32_t.h
file.o: /usr/include/sys/_types/_u_int64_t.h
file.o: /usr/include/sys/_types/_intptr_t.h
file.o: /usr/include/sys/_types/_uintptr_t.h
file.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_null.h
file.o: /usr/include/sys/stdio.h /usr/include/sys/_types/_off_t.h
file.o: /usr/include/sys/_types/_ssize_t.h /usr/include/secure/_stdio.h
file.o: /usr/include/secure/_common.h /usr/include/ctype.h
file.o: /usr/include/_ctype.h /usr/include/runetype.h
file.o: /usr/include/sys/_types/_ct_rune_t.h
file.o: /usr/include/sys/_types/_rune_t.h /usr/include/sys/_types/_wchar_t.h
file.o: /usr/include/sys/_types/_wint_t.h /usr/include/string.h
file.o: /usr/include/sys/_types/_rsize_t.h /usr/include/sys/_types/_errno_t.h
file.o: /usr/include/strings.h /usr/include/secure/_strings.h
file.o: /usr/include/secure/_string.h system.h atom.h cpu.h monitor.h file.h
