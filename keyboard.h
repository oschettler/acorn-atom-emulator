#ifdef HOST_X11
#include <X11/Xlib.h>
#include <X11/keysym.h>

void handle_key (XKeyEvent *key_event, bool pressed);
#endif

#ifdef HOST_SFML
#include <SFML/Window.hpp>  

void handle_key (sf::Event *key_event, bool pressed);
#endif


void init_keyboard (void);
void set_keyboard (UBYTE row);



