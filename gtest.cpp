#include <stdio.h>
#include <SFML/Graphics.hpp>

sf::RenderWindow window;
sf::Image image;
sf::Texture texture;
sf::Sprite sprite;

void
setPixel(int x, int y, int color)
{
  image.setPixel(x, y, sf::Color(color << 8 | 0xff));
}

int
main(int argc, char** argv)
{
  printf("Hallo Welt\n");

  window.create(sf::VideoMode(320, 240), "Grafiktest");
  image.create(320, 240, sf::Color::Black);
  texture.create(320, 240);
  sprite.setTexture(texture);

  while (window.isOpen())
  {
    sf::Event event;
    while (window.pollEvent(event))
    {
      if (event.type == sf::Event::Closed)
      {
        window.close();
      }
    }
    window.clear(sf::Color::Black);
    
    for (int i = 0; i < 20; i++)
    {
      setPixel(20 + i, 30 + i, 0x00ff00);
    }

    texture.update(image);
    window.draw(sprite);

    window.display();
  }
  printf("Und Tschüß\n");
  return 0;
}

