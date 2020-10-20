
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
main.o: /usr/include/sys/_pthread/_pthread_t.h system.h cpu.h atom.h screen.h
main.o: keyboard.h /usr/X11/include/X11/Xlib.h /usr/include/sys/types.h
main.o: /usr/include/sys/_types/_u_char.h /usr/include/sys/_types/_u_short.h
main.o: /usr/include/sys/_types/_u_int.h /usr/include/sys/_types/_caddr_t.h
main.o: /usr/include/sys/_types/_blkcnt_t.h
main.o: /usr/include/sys/_types/_blksize_t.h /usr/include/sys/_types/_gid_t.h
main.o: /usr/include/sys/_types/_in_addr_t.h
main.o: /usr/include/sys/_types/_in_port_t.h /usr/include/sys/_types/_ino_t.h
main.o: /usr/include/sys/_types/_ino64_t.h /usr/include/sys/_types/_key_t.h
main.o: /usr/include/sys/_types/_nlink_t.h /usr/include/sys/_types/_clock_t.h
main.o: /usr/include/sys/_types/_time_t.h
main.o: /usr/include/sys/_types/_useconds_t.h
main.o: /usr/include/sys/_types/_suseconds_t.h
main.o: /usr/include/sys/_types/_fd_def.h
main.o: /usr/include/sys/_types/_fd_setsize.h
main.o: /usr/include/sys/_types/_fd_set.h /usr/include/sys/_types/_fd_clr.h
main.o: /usr/include/sys/_types/_fd_zero.h
main.o: /usr/include/sys/_types/_fd_isset.h
main.o: /usr/include/sys/_types/_fd_copy.h
main.o: /usr/include/sys/_pthread/_pthread_cond_t.h
main.o: /usr/include/sys/_pthread/_pthread_condattr_t.h
main.o: /usr/include/sys/_pthread/_pthread_mutex_t.h
main.o: /usr/include/sys/_pthread/_pthread_mutexattr_t.h
main.o: /usr/include/sys/_pthread/_pthread_once_t.h
main.o: /usr/include/sys/_pthread/_pthread_rwlock_t.h
main.o: /usr/include/sys/_pthread/_pthread_rwlockattr_t.h
main.o: /usr/include/sys/_pthread/_pthread_key_t.h
main.o: /usr/include/sys/_types/_fsblkcnt_t.h
main.o: /usr/include/sys/_types/_fsfilcnt_t.h /usr/X11/include/X11/X.h
main.o: /usr/X11/include/X11/Xfuncproto.h /usr/X11/include/X11/Xosdefs.h
main.o: /usr/include/stddef.h /usr/include/sys/_types/_offsetof.h
main.o: /usr/include/sys/_types/_ptrdiff_t.h /usr/X11/include/X11/keysym.h
main.o: /usr/X11/include/X11/keysymdef.h monitor.h
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
atom.o: /usr/include/secure/_common.h system.h cpu.h atom.h screen.h
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
screen.o: /usr/include/stdio.h /usr/include/_stdio.h /usr/include/sys/cdefs.h
screen.o: /usr/include/sys/_symbol_aliasing.h
screen.o: /usr/include/sys/_posix_availability.h /usr/include/Availability.h
screen.o: /usr/include/AvailabilityInternal.h /usr/include/_types.h
screen.o: /usr/include/sys/_types.h /usr/include/machine/_types.h
screen.o: /usr/include/i386/_types.h
screen.o: /usr/include/sys/_pthread/_pthread_types.h
screen.o: /usr/include/sys/_types/_va_list.h /usr/include/machine/types.h
screen.o: /usr/include/i386/types.h /usr/include/sys/_types/_int8_t.h
screen.o: /usr/include/sys/_types/_int16_t.h
screen.o: /usr/include/sys/_types/_int32_t.h
screen.o: /usr/include/sys/_types/_int64_t.h
screen.o: /usr/include/sys/_types/_u_int8_t.h
screen.o: /usr/include/sys/_types/_u_int16_t.h
screen.o: /usr/include/sys/_types/_u_int32_t.h
screen.o: /usr/include/sys/_types/_u_int64_t.h
screen.o: /usr/include/sys/_types/_intptr_t.h
screen.o: /usr/include/sys/_types/_uintptr_t.h
screen.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_null.h
screen.o: /usr/include/sys/stdio.h /usr/include/sys/_types/_off_t.h
screen.o: /usr/include/sys/_types/_ssize_t.h /usr/include/secure/_stdio.h
screen.o: /usr/include/secure/_common.h /usr/X11/include/X11/Xlib.h
screen.o: /usr/include/sys/types.h /usr/include/sys/appleapiopts.h
screen.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
screen.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
screen.o: /usr/include/libkern/i386/_OSByteOrder.h
screen.o: /usr/include/sys/_types/_u_char.h
screen.o: /usr/include/sys/_types/_u_short.h /usr/include/sys/_types/_u_int.h
screen.o: /usr/include/sys/_types/_caddr_t.h /usr/include/sys/_types/_dev_t.h
screen.o: /usr/include/sys/_types/_blkcnt_t.h
screen.o: /usr/include/sys/_types/_blksize_t.h
screen.o: /usr/include/sys/_types/_gid_t.h
screen.o: /usr/include/sys/_types/_in_addr_t.h
screen.o: /usr/include/sys/_types/_in_port_t.h
screen.o: /usr/include/sys/_types/_ino_t.h /usr/include/sys/_types/_ino64_t.h
screen.o: /usr/include/sys/_types/_key_t.h /usr/include/sys/_types/_mode_t.h
screen.o: /usr/include/sys/_types/_nlink_t.h /usr/include/sys/_types/_id_t.h
screen.o: /usr/include/sys/_types/_pid_t.h /usr/include/sys/_types/_uid_t.h
screen.o: /usr/include/sys/_types/_clock_t.h
screen.o: /usr/include/sys/_types/_time_t.h
screen.o: /usr/include/sys/_types/_useconds_t.h
screen.o: /usr/include/sys/_types/_suseconds_t.h
screen.o: /usr/include/sys/_types/_rsize_t.h
screen.o: /usr/include/sys/_types/_errno_t.h
screen.o: /usr/include/sys/_types/_fd_def.h
screen.o: /usr/include/sys/_types/_fd_setsize.h
screen.o: /usr/include/sys/_types/_fd_set.h /usr/include/sys/_types/_fd_clr.h
screen.o: /usr/include/sys/_types/_fd_zero.h
screen.o: /usr/include/sys/_types/_fd_isset.h
screen.o: /usr/include/sys/_types/_fd_copy.h
screen.o: /usr/include/sys/_pthread/_pthread_attr_t.h
screen.o: /usr/include/sys/_pthread/_pthread_cond_t.h
screen.o: /usr/include/sys/_pthread/_pthread_condattr_t.h
screen.o: /usr/include/sys/_pthread/_pthread_mutex_t.h
screen.o: /usr/include/sys/_pthread/_pthread_mutexattr_t.h
screen.o: /usr/include/sys/_pthread/_pthread_once_t.h
screen.o: /usr/include/sys/_pthread/_pthread_rwlock_t.h
screen.o: /usr/include/sys/_pthread/_pthread_rwlockattr_t.h
screen.o: /usr/include/sys/_pthread/_pthread_t.h
screen.o: /usr/include/sys/_pthread/_pthread_key_t.h
screen.o: /usr/include/sys/_types/_fsblkcnt_t.h
screen.o: /usr/include/sys/_types/_fsfilcnt_t.h /usr/X11/include/X11/X.h
screen.o: /usr/X11/include/X11/Xfuncproto.h /usr/X11/include/X11/Xosdefs.h
screen.o: /usr/include/stddef.h /usr/include/sys/_types/_offsetof.h
screen.o: /usr/include/sys/_types/_ptrdiff_t.h
screen.o: /usr/include/sys/_types/_wchar_t.h
screen.o: /usr/include/sys/_types/_wint_t.h /usr/X11/include/X11/Xutil.h
screen.o: /usr/X11/include/X11/keysym.h /usr/X11/include/X11/keysymdef.h
screen.o: system.h cpu.h screen.h keyboard.h atom.h
keyboard.o: /usr/include/stdio.h /usr/include/_stdio.h
keyboard.o: /usr/include/sys/cdefs.h /usr/include/sys/_symbol_aliasing.h
keyboard.o: /usr/include/sys/_posix_availability.h
keyboard.o: /usr/include/Availability.h /usr/include/AvailabilityInternal.h
keyboard.o: /usr/include/_types.h /usr/include/sys/_types.h
keyboard.o: /usr/include/machine/_types.h /usr/include/i386/_types.h
keyboard.o: /usr/include/sys/_pthread/_pthread_types.h
keyboard.o: /usr/include/sys/_types/_va_list.h /usr/include/machine/types.h
keyboard.o: /usr/include/i386/types.h /usr/include/sys/_types/_int8_t.h
keyboard.o: /usr/include/sys/_types/_int16_t.h
keyboard.o: /usr/include/sys/_types/_int32_t.h
keyboard.o: /usr/include/sys/_types/_int64_t.h
keyboard.o: /usr/include/sys/_types/_u_int8_t.h
keyboard.o: /usr/include/sys/_types/_u_int16_t.h
keyboard.o: /usr/include/sys/_types/_u_int32_t.h
keyboard.o: /usr/include/sys/_types/_u_int64_t.h
keyboard.o: /usr/include/sys/_types/_intptr_t.h
keyboard.o: /usr/include/sys/_types/_uintptr_t.h
keyboard.o: /usr/include/sys/_types/_size_t.h /usr/include/sys/_types/_null.h
keyboard.o: /usr/include/sys/stdio.h /usr/include/sys/_types/_off_t.h
keyboard.o: /usr/include/sys/_types/_ssize_t.h /usr/include/secure/_stdio.h
keyboard.o: /usr/include/secure/_common.h /usr/X11/include/X11/Xlib.h
keyboard.o: /usr/include/sys/types.h /usr/include/sys/appleapiopts.h
keyboard.o: /usr/include/machine/endian.h /usr/include/i386/endian.h
keyboard.o: /usr/include/sys/_endian.h /usr/include/libkern/_OSByteOrder.h
keyboard.o: /usr/include/libkern/i386/_OSByteOrder.h
keyboard.o: /usr/include/sys/_types/_u_char.h
keyboard.o: /usr/include/sys/_types/_u_short.h
keyboard.o: /usr/include/sys/_types/_u_int.h
keyboard.o: /usr/include/sys/_types/_caddr_t.h
keyboard.o: /usr/include/sys/_types/_dev_t.h
keyboard.o: /usr/include/sys/_types/_blkcnt_t.h
keyboard.o: /usr/include/sys/_types/_blksize_t.h
keyboard.o: /usr/include/sys/_types/_gid_t.h
keyboard.o: /usr/include/sys/_types/_in_addr_t.h
keyboard.o: /usr/include/sys/_types/_in_port_t.h
keyboard.o: /usr/include/sys/_types/_ino_t.h
keyboard.o: /usr/include/sys/_types/_ino64_t.h
keyboard.o: /usr/include/sys/_types/_key_t.h
keyboard.o: /usr/include/sys/_types/_mode_t.h
keyboard.o: /usr/include/sys/_types/_nlink_t.h
keyboard.o: /usr/include/sys/_types/_id_t.h /usr/include/sys/_types/_pid_t.h
keyboard.o: /usr/include/sys/_types/_uid_t.h
keyboard.o: /usr/include/sys/_types/_clock_t.h
keyboard.o: /usr/include/sys/_types/_time_t.h
keyboard.o: /usr/include/sys/_types/_useconds_t.h
keyboard.o: /usr/include/sys/_types/_suseconds_t.h
keyboard.o: /usr/include/sys/_types/_rsize_t.h
keyboard.o: /usr/include/sys/_types/_errno_t.h
keyboard.o: /usr/include/sys/_types/_fd_def.h
keyboard.o: /usr/include/sys/_types/_fd_setsize.h
keyboard.o: /usr/include/sys/_types/_fd_set.h
keyboard.o: /usr/include/sys/_types/_fd_clr.h
keyboard.o: /usr/include/sys/_types/_fd_zero.h
keyboard.o: /usr/include/sys/_types/_fd_isset.h
keyboard.o: /usr/include/sys/_types/_fd_copy.h
keyboard.o: /usr/include/sys/_pthread/_pthread_attr_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_cond_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_condattr_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_mutex_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_mutexattr_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_once_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_rwlock_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_rwlockattr_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_t.h
keyboard.o: /usr/include/sys/_pthread/_pthread_key_t.h
keyboard.o: /usr/include/sys/_types/_fsblkcnt_t.h
keyboard.o: /usr/include/sys/_types/_fsfilcnt_t.h /usr/X11/include/X11/X.h
keyboard.o: /usr/X11/include/X11/Xfuncproto.h /usr/X11/include/X11/Xosdefs.h
keyboard.o: /usr/include/stddef.h /usr/include/sys/_types/_offsetof.h
keyboard.o: /usr/include/sys/_types/_ptrdiff_t.h
keyboard.o: /usr/include/sys/_types/_wchar_t.h
keyboard.o: /usr/include/sys/_types/_wint_t.h /usr/X11/include/X11/Xutil.h
keyboard.o: /usr/X11/include/X11/keysym.h /usr/X11/include/X11/keysymdef.h
keyboard.o: system.h cpu.h atom.h keyboard.h
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
