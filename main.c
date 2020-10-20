#include    <stdio.h>
#include    <stdlib.h>
#include    <string.h>
#include    <fcntl.h>
#include    <ctype.h>
#include    <signal.h>

#define FALSE   0
#define TRUE    1

#include    "system.h"
#include    "cpu.h"
#include    "atom.h"
#include    "screen.h"
#include    "keyboard.h"
#include    "monitor.h"

int    countdown;

void Atom_OS (void);
void load_image (char *filename, int addr);

void sigint_handler ()
{
    printf ("*** break ***\n");

    if (monitor () == 1)
    {
        signal (SIGINT, sigint_handler);
        return;
    }

#ifdef REDIRECT_STDERR
    fclose (stderr);
#endif

    exit_screen ();

    exit (0);
}

int main (int argc, char **argv)
{
    int     error;

#ifdef REDIRECT_STDERR
    freopen ("error.log", "w", stderr);
#endif

    printf ("Acorn Atom Emulator\n");

    init_memory ();
    init_screen ();
    init_keyboard ();

    signal (SIGINT, sigint_handler);

    error = FALSE;

    /********
    for (i=1;i<argc;i++)
    {
        if (*argv[i] == '-')
        {
        }
        else
            error = TRUE;
    }
    ********/

    if (error)
    {
        printf ("Usage: %s\n", argv[0]);
        exit (1);
    }

    Atom_OS ();

    return 0;
}

void Atom_OS ()
{
    load_image ("akernel.rom", 0xF000);
    load_image ("abasic.rom", 0xC000);
    load_image ("afloat.rom", 0xD000);

    attrib[0xb000] = HARDWARE;
    attrib[0xb002] = HARDWARE;
    memory[0xb002] = 0x40;

    CPU_Reset ();

    for(;;)
    {
        memory[0xb002] = (memory[0xb002] & 0x7f);
        /* fprintf(stderr, "\nL"); */
        GO(100);
        memory[0xb002] = (memory[0xb002] & 0x7f) | 0x80;
        /* fprintf(stderr, "\nH"); */
        GO(900);
        atom_hardware();
        update_screen();
    }
}


void load_image (char *filename, int addr)
{   int start_addr = addr;
    int    fd;

    fd = open (filename, O_RDONLY);
    if (fd != -1)
    {
        UBYTE b;

        while (read (fd, &b, 1) == 1)
            memory[addr++] = b;

        close (fd);
        SetMemory(start_addr, addr - 1, ROM);
    }
    else {
        printf("load image: could not find %s\n", filename);
        exit (1);
    }
}


