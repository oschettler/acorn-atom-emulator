#include <stdio.h>
#include <stdlib.h>

#include <X11/Xlib.h>
#include <X11/Xutil.h>

#include "system.h"
#include "cpu.h"
#include "screen.h"
#include "keyboard.h"
#include "atom.h"



#define WIDTH   256
#define HEIGHT  192

static Display	*display;
static Screen	*screen;
static Window	window;
static Visual	*visual;

static XComposeStatus	keyboard_status;

static XImage	*image;
static GC	gc;

bool need_to_refresh = FALSE;

static int colortable[4] =
{

    0x000000,
    0xff0000,
    0x00ff00,
    0xffffff
};

static int  colours[4];

static bool mode;
static int xlen,  /* number of pixels in x direction */
           xpix,  /* size of a pixel in x direction */
           ylen,  /* number of pizels in y direction */
           ypix,  /* size of a pixel in y direction */
           xlen8, /* number of bytes for one line */
           len8,  /* number of bytes in the whole screen */
           color; /* 8: black/white, 4: color graphics */

void init_screen()
{   int i;

	XSetWindowAttributes	xswda;

	XGCValues	xgcvl;

	int	depth;

	char	*data;
	int	offset = 0;
	int	bitmap_pad = 8;
	int	bytes_per_line = 0;

	display = XOpenDisplay (NULL);
	if (!display)
	{
		printf ("Failed to open display\n");
		exit (1);
	}

	screen = XDefaultScreenOfDisplay (display);
	if (!screen)
	{
		printf ("Unable to get screen\n");
		exit (1);
	}

	depth = XDefaultDepthOfScreen (screen);

    xswda.event_mask = KeyPress | KeyRelease |
                       ExposureMask | EnterWindowMask | LeaveWindowMask;

	window = XCreateWindow (display,
			XRootWindowOfScreen(screen),
			50, 50,
			WIDTH, HEIGHT, 3, depth,
			InputOutput, visual,
			CWEventMask | CWBackPixel,
			&xswda);

	XStoreName (display, window, TITLE);

    for (i=0;i<4;i++)
	{
		XColor	colour;

		int	rgb = colortable[i];
		int	status;

		colour.red = (rgb & 0x00ff0000) >> 8;
		colour.green = (rgb & 0x0000ff00);
		colour.blue = (rgb & 0x000000ff) << 8;

		status = XAllocColor (display,
				XDefaultColormapOfScreen(screen),
				&colour);

        colours[i] = colour.pixel;
	}

    xgcvl.background = colours[0];
    xgcvl.foreground = colours[3];

    gc = XCreateGC (display, window,
		GCForeground | GCBackground,
		&xgcvl);

	XMapWindow (display, window);

	XSync (display, False);

	data = malloc (WIDTH * HEIGHT);
	if (!data)
	{
		printf ("Failed to allocate space for image\n");
		exit (1);
	}

	image = XCreateImage (display,
			visual,
			8,
			ZPixmap,
			offset,
			data,
			WIDTH,
			HEIGHT,
			bitmap_pad,
			bytes_per_line);
	if (!image)
	{
		printf ("Failed to allocate image\n");
		exit (1);
	}

    mode = 1;
    set_mode(0, 1);

    SetMemory(0x8000, 0x81FF, VIDEO);
}

void exit_screen()
{
	XSync (display, True);

	XDestroyImage (image);
	XUnmapWindow (display, window);
	XDestroyWindow (display, window);
	XCloseDisplay (display);
}

void refresh_screen()
{   
    XPutImage (display, window, gc, image, 0, 0, 0, 0, WIDTH, HEIGHT);
}

void update_screen()
{
    if (need_to_refresh)
    {   XPutImage (display, window, gc, image, 0, 0, 0, 0, WIDTH, HEIGHT);
        need_to_refresh = FALSE;
    }
}

void atom_hardware (void)
{
    while (XEventsQueued (display, QueuedAfterFlush) > 0)
    {
        XEvent  xevent;

        XNextEvent (display, &xevent);

        switch ( xevent.type )
		{
			case Expose :
                refresh_screen();
				break;

			case KeyPress :
                handle_key (( XKeyEvent* ) &xevent, TRUE );
				break;

			case KeyRelease :
                handle_key (( XKeyEvent* ) &xevent, FALSE );
				break;

			case EnterNotify :
                XAutoRepeatOff ( display );
                XFlush ( display );
				break;

			case LeaveNotify :
                XAutoRepeatOn ( display );
                XFlush ( display );
				break;

			default :
				/*
				 * All other events are masked out, so this should
				 * barf big-time.
				 */

				break;
		}
	}
}

void set_mode(UBYTE graphic, SBYTE graphic_mode)
{   /* CLEAR 0 is mapped to text mode, with cursor off, uses
       the graphical characters */

    if (graphic)
    {   int x,y,i,b;

        if (mode == graphic_mode)
            return;
        mode = graphic_mode;

        switch(mode)
        {   case 0: xlen =  64; ylen =  64; color = 4; break; /* CLEAR 1a */
            case 1: xlen = 128; ylen =  64; color = 8; break; /* CLEAR 1 */
            case 2: xlen = 128; ylen =  64; color = 4; break; /* CLEAR 2a */
            case 3: xlen = 128; ylen =  96; color = 8; break; /* CLEAR 2 */
            case 4: xlen = 128; ylen =  96; color = 4; break; /* CLEAR 3a */
            case 5: xlen = 128; ylen = 192; color = 8; break; /* CLEAR 3 */
            case 6: xlen = 128; ylen = 192; color = 4; break; /* CLEAR 4a */
            case 7: xlen = 256; ylen = 192; color = 8; break; /* CLEAR 4 */
        }
        xpix = 256 / xlen;
        ypix = 192 / ylen;
        xlen8 = xlen / color;
        len8 = xlen8 * ylen;


        printf("mode %d, xlen %d, ylen %d, xpix %d, ypix %d, xlen8 %d\n",
                mode,    xlen,    ylen,    xpix,    ypix,    xlen8);
        SetMemory(0x8000, 0x7fff + len8, VIDEO);
        SetMemory(0x8000 + len8, 0x9800, RAM);

        b = 0x8000;
        for (y = 0; y < 192; y += ypix)
        {   x = 0;
            for (i = 0; i < xlen8; i++, b++)
            {   int v = memory[b];
                int k;

                if (color == 4)
                    for (k = 6; k >= 0; k -= 2)
                    {   int x2, y2,
                            c = colours[(v >> k) & 3];

                        for (x2 = 0; x2 < xpix; x2++, x++)
                            for (y2 = 0; y2 < ypix; y2++)
                                XPutPixel (image, x, y + y2, c);
                    }
                else
                    for (k = 7; k >= 0; k--)
                    {   int x2, y2,
                            c = colours[((v >> k) & 1) ? 3 : 0];

                        for (x2 = 0; x2 < xpix; x2++, x++)
                            for (y2 = 0; y2 < ypix; y2++)
                                XPutPixel (image, x, y + y2, c);
                    }
            }
        }
    }
    else
    {   int x, y, b;

        if (mode == -1)
            return;
        mode = -1;

        SetMemory(0x8000, 0x81ff, VIDEO);
        SetMemory(0x8200, 0x9800, RAM);

        b = 0x8000;
        for (y = 0; y < 192; y += 12)
            for (x = 0; x < 256; x += 8, b++)
                draw_character(x, y, memory[b]);
    }
    need_to_refresh = TRUE; 
    /* XPutImage (display, window, gc, image, 0, 0, 0, 0, WIDTH, HEIGHT); */
}


UBYTE char_rep[64][7] =
{ { 14,17, 1,13,21,21,14 },
  {  4,10,17,17,31,17,17 },
  { 30, 9, 9,14, 9, 9,30 },
  { 14,17,16,16,16,17,14 },
  { 30, 9, 9, 9, 9, 9,30 },
  { 31,16,16,28,16,16,31 },
  { 31,16,16,30,16,16,16 },
  { 15,16,16,19,17,17,15 },
  { 17,17,17,31,17,17,17 },
  { 14, 4, 4, 4, 4, 4,14 },
  {  1, 1, 1,17,17,10, 4 },
  { 17,18,20,24,24,20,18 },
  { 16,16,16,16,16,16,31 },
  { 17,27,21,17,17,17,17 },
  { 17,25,21,19,17,17,17 },
  { 14,17,17,17,17,17,14 },
  { 30,17,17,30,16,16,16 },
  { 14,17,17,17,21,18,13 },
  { 30,17,17,30,20,18,17 },
  { 14,17, 8, 4, 2,17,14 },
  { 31, 4, 4, 4, 4, 4, 4 },
  { 17,17,17,17,17,17,14 },
  { 17,17,17,17,10,10, 4 },
  { 17,17,17,17,21,27,17 },
  { 17,17,10, 4,10,17,17 },
  { 17,17,10, 4, 4, 4, 4 },
  { 31, 1, 2, 4, 8,16,31 },
  { 14, 8, 8, 8, 8, 8,14 },
  { 16,16, 8, 4, 2, 1, 1 },
  { 14, 2, 2, 2, 2, 2,14 },
  {  4,14,31, 4, 4, 4, 4 },
  {  0, 4, 8,31, 8, 4, 0 },
  {  0, 0, 0, 0, 0, 0, 0 },
  {  4, 4, 4, 4, 4, 0, 4 },
  { 10,10, 0, 0, 0, 0, 0 },
  { 10,10,27, 0,27,10,10 },
  {  4,15,16,14, 1,30, 4 },
  { 25,25, 2, 4, 8,19,19 },
  {  8,20,20, 9,22,22, 9 },
  {  4, 4, 0, 0, 0, 0, 0 },
  {  2, 4, 8, 8, 8, 4, 2 },
  {  8, 4, 2, 2, 2, 4, 8 },
  {  0, 4,14,31,14, 4, 0 },
  {  0, 4, 4,31, 4, 4, 0 },
  {  0, 0, 0, 6, 6, 2, 4 },
  {  0, 0, 0,31, 0, 0, 0 },
  {  0, 0, 0, 0, 0, 4, 4 },
  {  1, 1, 2, 4, 8,16,16 },
  {  4,10,10,10,10,10, 4 },
  {  4,12, 4, 4, 4, 4,14 },
  { 14,17, 1,14,16,16,31 },
  { 14,17, 1, 6, 1,17,14 },
  {  2, 6,10,31, 2, 2, 2 },
  { 31,16,30, 1, 1,17,14 },
  { 14,16,16,30,17,17,14 },
  { 31, 1, 2, 4, 8,16,16 },
  { 14,17,17,14,17,17,14 },
  { 14,17,17,15, 1, 1,14 },
  {  0, 0, 4, 0, 4, 0, 0 },
  {  6, 6, 0, 6, 6, 2, 4 },
  {  2, 4, 8,16, 8, 4, 2 },
  {  0, 0,31, 0,31, 0, 0 },
  { 16, 8, 4, 2, 4, 8,16 },
  {  4,10, 2, 4, 4, 0, 4 },
};

static void draw_char(int x0, int y, UBYTE ch, UBYTE bl, UBYTE wh)
{   int i, x, j,
        x2 = x0 + 2,
        x8 = x0 + 8;
    UBYTE *ch_rep = char_rep[ch];

    for (i = 0; i < 3; i++, y++)
        for (x = x0; x < x8; x++)
            XPutPixel (image, x, y, bl);
    for (i = 0; i < 7; i++, y++, ch_rep++)
    {   for (x = x0; x < x2; x++)
            XPutPixel (image, x, y, bl);
        for (j = 4; j >= 0; j--, x++)
            XPutPixel (image, x, y, ((*ch_rep >> j) & 1) ? wh : bl);
        XPutPixel (image, x, y, bl);
    }
    for (i = 0; i < 2; i++, y++)
        for (x = x0; x < x8; x++)
            XPutPixel (image, x, y, bl);
}

static void draw_gr(int x, int y, UBYTE bl, UBYTE wh)
{   int i;

    for (i = 0; i < 2; i++)
    {   XPutPixel (image, x,     y, bl);
        XPutPixel (image, x + 1, y, wh);
        XPutPixel (image, x + 2, y, bl);
        XPutPixel (image, x + 3, y, wh);
        y++;
        XPutPixel (image, x,     y, wh);
        XPutPixel (image, x + 1, y, wh);
        XPutPixel (image, x + 2, y, wh);
        XPutPixel (image, x + 3, y, wh);
        y++;
    }
}

static void draw_graph(int x, int y, UBYTE ch, UBYTE bl, UBYTE wh)
{
    int v;

    v = ch & 32;
    draw_gr(x,     y, v ? bl : colours[0], v ? wh : colours[0]);
    v = ch & 16;
    draw_gr(x + 4, y, v ? bl : colours[0], v ? wh : colours[0]);
    y += 4;
    v = ch & 8;
    draw_gr(x,     y, v ? bl : colours[0], v ? wh : colours[0]);
    v = ch & 4;
    draw_gr(x + 4, y, v ? bl : colours[0], v ? wh : colours[0]);
    y += 4;
    v = ch & 2;
    draw_gr(x,     y, v ? bl : colours[0], v ? wh : colours[0]);
    v = ch & 1;
    draw_gr(x + 4, y, v ? bl : colours[0], v ? wh : colours[0]);
}

void draw_character(int x, int y, UBYTE ch)
{
    if (ch < 64)
        draw_char(x, y, ch, colours[0], colours[3]);
    else if (ch < 128)
        draw_graph(x, y, ch, colours[3], colours[3]);
    else if (ch < 192)
        draw_char(x, y, ch - 128, colours[3], colours[0]);
    else
        draw_graph(x, y, ch, colours[3], colours[0]);
}

void update_video(UWORD addr, UBYTE v)
{   UWORD pos = addr - 0x8000;

    if (memory[addr] == v)
        return;

    memory[addr] = v;
    if (mode == -1)
    {   int x = (pos % 32) * 8,
            y = (pos / 32) * 12;
        draw_character(x, y, v);
        /* copy [x, x + 7] [y, y + 11] */
        XPutImage (display, window, gc, image, x, y, x, y, 8, 12);
    }
    else
    {   int xb = pos % xlen8,       /* x pos in bytes */
            xo = xb * color * xpix,     /* x pos on screen */
            x = xo,
            yb = pos / xlen8,       /* y pos in bytes */
            yo  = yb * ypix,        /* y pos on screen */ 
            y = yo,
            k;

        if (color == 4)
            for (k = 6; k >= 0; k -= 2)
            {   int x2, y2,
                    c = colours[(v >> k) & 3];

                for (x2 = 0; x2 < xpix; x2++, x++)
                    for (y2 = 0; y2 < ypix; y2++)
                        XPutPixel (image, x, y + y2, c);
            }
        else
            for (k = 7; k >= 0; k--)
            {   int x2, y2,
                    c = colours[((v >> k) & 1) ? 3 : 0];

                for (x2 = 0; x2 < xpix; x2++, x++)
                    for (y2 = 0; y2 < ypix; y2++)
                        XPutPixel (image, x, y + y2, c);
            }

        /* copy [xo, xo + color * xpix - 1] [y, y + ypix - 1] */
        XPutImage (display, window, gc, image, xo, yo, xo, yo, 
                   color * xpix, ypix);
    }
    /* need_to_refresh = TRUE; */
    /* XPutImage (display, window, gc, image, 0, 0, 0, 0, WIDTH, HEIGHT); */
}

