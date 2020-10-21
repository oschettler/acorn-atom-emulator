#ifdef HOST_SFML
#include <SFML/Window.hpp>    
#include <SFML/Graphics.hpp>
extern sf::RenderWindow window;
#endif

void init_screen(void);
void exit_screen(void);
void refresh_screen(void);
void update_screen(void);
void atom_hardware(void);
void set_mode(UBYTE graphic, SBYTE graphic_mode);
void draw_character(int x, int y, UBYTE ch);
void update_video(UWORD addr, UBYTE v);

