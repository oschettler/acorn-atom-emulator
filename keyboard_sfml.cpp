#ifdef HOST_SFML

#include	<stdio.h>

#include	"system.h"
#include	"cpu.h"
#include    "atom.h"
#include    "keyboard.h"


static int  control = 0;
static int  shift = 0;
static int  alt = 0;
static int  keys_pressed = 0;
static int  shifted_keys = 0;
static UBYTE keys[16];


void init_keyboard (void)
{   int i;

    for (i = 0; i < 16; i++)
        keys[i] = 0x3f;

    control = 0;
    shift = 0;
    alt = 0;
    keys_pressed = 0;
    shifted_keys = 0;
}

void handle_key (sf::Event *key_event, bool pressed)
{
    UWORD   keycode;

#define KEY(S,R,P) keycode = (S << 10) | (R << 6) | (1 << P)
#define SHIFT(X) ((X >> 10) & 1)
#define ROW(X)   ((X >> 6) & 15)
#define POS(X)   (X & 63)

#ifdef DEBUG
    printf("keysym : %d, %d\n", key_event->key.code, pressed);
#endif

    keycode = 0xFFFF;

    switch (key_event->key.code)
    {
        case sf::Keyboard::LShift:
        case sf::Keyboard::RShift:
            if (pressed)
                shift++;
            else
                shift--;
            break;
        case sf::Keyboard::LControl:
        case sf::Keyboard::RControl:
            if (pressed)
                control = 1;
            else
                control = 0;
            break;
        case sf::Keyboard::LAlt:
        case sf::Keyboard::RAlt:
            if (pressed)
                alt = 1;
            else
                alt = 0;
            break;
        case sf::Keyboard::F1: CPU_Reset(); break;
        case sf::Keyboard::F5:
        case sf::Keyboard::F2:
        case sf::Keyboard::F3:
        case sf::Keyboard::F4:
        case sf::Keyboard::F6:
        case sf::Keyboard::F7:
            break;
        case sf::Keyboard::Home:                break;
        case sf::Keyboard::Insert:              break;
        case 59 /*XK_Delete*/:           KEY(0,4,1);  break;
        case sf::Keyboard::Left :        KEY(1,3,0); break;
        case sf::Keyboard::Up :          KEY(0,2,0); break;
        case sf::Keyboard::Right :       KEY(0,3,0); break;
        case sf::Keyboard::Down :        KEY(1,2,0); break;
        case sf::Keyboard::Escape :      KEY(0,0,5); break;
        case sf::Keyboard::Tab :                     break;
        case 53 /*XK_numbersign*/ :
            if (shift)
                /*XK_asciicircum*/
                KEY(0,5,0);
            else
                KEY(1,0,1);
            break;
        case 55/*XK_quoteright*/ :  KEY(1,6,2); break;
        //case XK_at :          KEY(0,7,3); break;
        //case XK_parenleft :   KEY(1,5,2); break;
        //case XK_parenright :  KEY(1,4,2); break;
        case 56 /*XK_less*/ :
            if (shift)
                // XK_greater
                KEY(1,9,3);
            else
                KEY(1,1,2);
            break;
        //case XK_question :    KEY(1,8,3); break;
        case 52 /*XK_minus*/ :  KEY(0,0,2); break;
        case 47 /*XK_plus*/ :
            if (shift)
                // XK_asterisk
                KEY(1,3,2);
            else
                KEY(1,2,2);
            break;
        case sf::Keyboard::Comma :
            if (shift)
                // XK_semicolon
                KEY(0,2,2);
            else
                KEY(0,1,2);
            break;
        case sf::Keyboard::Period :      KEY(0,9,3); break;
        //case XK_underscore :              break;
        //case XK_bracketleft : KEY(0,8,0); break;
        //case XK_bracketright :KEY(0,6,0); break;
        //case XK_asciicircum : KEY(0,5,0); break;
        //case XK_bar :                     break;
        case sf::Keyboard::Num0 :
            if (shift)
                // XK_equal
                KEY(1,0,2);
            else
                KEY(0,3,1); 
            break;
        case sf::Keyboard::Num1 :
            if (shift)
                // XK_exclam
                KEY(1,2,1);
            else
                KEY(0,2,1); 
            break;
        case sf::Keyboard::Num2 :
            if (shift)
                // XK_quotedbl
                KEY(1,1,1);
            else
                KEY(0,1,1);
            break;
        case sf::Keyboard::Num3 :
            if (shift)
                // ??? Paragraph
                break;
            else
                KEY(0,0,1); 
            break;
        case sf::Keyboard::Num4 :
            if (shift)
                // XK_dollar
                KEY(1,9,2);
            else
                KEY(0,9,2);
            break;
        case sf::Keyboard::Num5 :
            if (shift)
                // XK_percent
                KEY(1,8,2);
            else
                KEY(0,8,2);
            break;
        case sf::Keyboard::Num6 :
            if (shift)
                // XK_ampersand
                KEY(1,7,2);
            else
                KEY(0,7,2);
            break;
        case sf::Keyboard::Num7 :
            if (shift)
                // XK_slash
                KEY(0,8,3);
            else
                KEY(0,6,2);
            break;
        case sf::Keyboard::Num8 :
            if (shift)
                // XK_parenleft
                KEY(1,5,2);
            else
                KEY(0,5,2);
            break;
        case sf::Keyboard::Num9 :
            if (shift)
                // XK_parenright
                KEY(1,4,2);
            else
                KEY(0,4,2);
            break;
        case sf::Keyboard::Space :       KEY(0,9,0); break; 
        case sf::Keyboard::Return :      KEY(0,6,1); break;
        //case XK_a :           KEY(0,6,3); break;
        case sf::Keyboard::A :  if (shift) KEY(1,6,3); else KEY(0,6,3); break;
        //case XK_b :           KEY(0,5,3); break;
        case sf::Keyboard::B :  if (shift) KEY(1,5,3); else KEY(0,5,3); break;
        //case XK_c :           KEY(0,4,3); break;
        case sf::Keyboard::C :  if (shift) KEY(1,4,3); else KEY(0,4,3); break;
        //case XK_d :           KEY(0,3,3); break;
        case sf::Keyboard::D :  if (shift) KEY(1,3,3); else KEY(0,3,3); break;
        //case XK_e :           KEY(0,2,3); break;
        case sf::Keyboard::E :  if (shift) KEY(1,2,3); else KEY(0,2,3); break;
        //case XK_f :           KEY(0,1,3); break;
        case sf::Keyboard::F :  if (shift) KEY(1,1,3); else KEY(0,1,3); break;
        //case XK_g :           KEY(0,0,3); break;
        case sf::Keyboard::G :  if (shift) KEY(1,0,3); else KEY(0,0,3); break;
        //case XK_h :           KEY(0,9,4); break;
        case sf::Keyboard::H :  if (shift) KEY(1,9,4); else KEY(0,9,4); break;
        //case XK_i :           KEY(0,8,4); break;
        case sf::Keyboard::I :  if (shift) KEY(1,8,4); else KEY(0,8,4); break;
        //case XK_j :           KEY(0,7,4); break;
        case sf::Keyboard::J :  if (shift) KEY(1,7,4); else KEY(0,7,4); break;
        //case XK_k :           KEY(0,6,4); break;
        case sf::Keyboard::K :  if (shift) KEY(1,6,4); else KEY(0,6,4); break;
        //case XK_l :           KEY(0,5,4); break;
        case sf::Keyboard::L :
            if (alt)
                // XK_at
                KEY(0,7,3);
            else
            {
                if (shift) KEY(1,5,4); else KEY(0,5,4); 
            }
            break;
        //case XK_m :           KEY(0,4,4); break;
        case sf::Keyboard::M : if (shift) KEY(1,4,4); else KEY(0,4,4); break;
        //case XK_n :           KEY(0,3,4); break;
        case sf::Keyboard::N : if (shift) KEY(1,3,4); else KEY(0,3,4); break;
        //case XK_o :           KEY(0,2,4); break;
        case sf::Keyboard::O : if (shift) KEY(1,2,4); else KEY(0,2,4); break;
        //case XK_p :           KEY(0,1,4); break;
        case sf::Keyboard::P : if (shift) KEY(1,1,4); else KEY(0,1,4); break;
        //case XK_q :           KEY(0,0,4); break;
        case sf::Keyboard::Q : if (shift) KEY(1,0,4); else KEY(0,0,4); break;
        //case XK_r :           KEY(0,9,5); break;
        case sf::Keyboard::R : if (shift) KEY(1,9,5); else KEY(0,9,5); break;
        //case XK_s :           KEY(0,8,5); break;
        case sf::Keyboard::S : if (shift) KEY(1,8,5); else KEY(0,8,5); break;
        //case XK_t :           KEY(0,7,5); break;
        case sf::Keyboard::T : if (shift) KEY(1,7,5); else KEY(0,7,5); break;
        //case XK_u :           KEY(0,6,5); break;
        case sf::Keyboard::U : if (shift) KEY(1,6,5); else KEY(0,6,5); break;
        //case XK_v :           KEY(0,5,5); break;
        case sf::Keyboard::V : if (shift) KEY(1,5,5); else KEY(0,5,5); break;
        //case XK_w :           KEY(0,4,5); break;
        case sf::Keyboard::W : if (shift) KEY(1,4,5); else KEY(0,4,5); break;
        //case XK_x :           KEY(0,3,5); break;
        case sf::Keyboard::X : if (shift) KEY(1,3,5); else KEY(0,3,5); break;
        //case XK_y :           KEY(0,2,5); break;
        case sf::Keyboard::Y : if (shift) KEY(1,2,5); else KEY(0,2,5); break;
        //case XK_z :           KEY(0,1,5); break;
        case sf::Keyboard::Z : if (shift) KEY(1,1,5); else KEY(0,1,5); break;
        default :
            keycode = 0xFFFF;
            printf ("Received unhandled key %x\n", (int)key_event->key.code);
            break;        
    }

    if (keycode != 0xFFFF)
    {
        if (pressed)
        {   keys_pressed++;
            if (SHIFT(keycode))
                shifted_keys++;
            keys[ROW(keycode)] &= ~POS(keycode);
        }
        else
        {   keys_pressed--;
            if (SHIFT(keycode))
                shifted_keys--;
            keys[ROW(keycode)] |= POS(keycode);
        }
    }
    memory[ 0xb001 ] = keys[ memory[0xb000] & 0x0f ]
                     | (  (keys_pressed ? shifted_keys : shift)
                        ? 0 : 0x80)
                     | (control ? 0 : 0x40);
    memory[ 0xb002 ] = (memory[ 0xb002 ] & 0xbf)
                     | (alt ? 0 : 0x40 );
#ifdef DEBUG
    {   int i;
        printf("%04x r:%d p:%d s:%d %02x->%02x  ", (int)key_event->key.code, 
               ROW(keycode), POS(keycode), SHIFT(keycode),
               memory[ 0xb000 ], memory[ 0xb001 ]);
        for (i = 0; i < 10; i++)
            printf("%02x ", keys[i]);
        printf("\n");
    }
#endif
}

void set_keyboard (UBYTE row)
{
    memory[ 0xb001 ] = keys[row] 
                     | (  (keys_pressed ? shifted_keys : shift) 
                        ? 0 : 0x80) 
                     | (control ? 0 : 0x40);
    memory[ 0xb002 ] = (memory[ 0xb002 ] & 0xbf)
                     | (alt ? 0 : 0x40 );
    /* fprintf(stderr, "%d=%02x ", row, memory[ 0xb001 ] ); */
}


#endif