import org.gicentre.handy.*;
import java.util.*;

HandyRenderer _h;
ArrayList<Heart> _hearts;
float _color_value;
float _roughness;
float _i_max;

void setup()
{
  size(512, 512);
  frameRate(30);
  _h = HandyPresets.createColouredPencil(this);
    
  _hearts = new ArrayList<Heart>();
  _hearts.add(new Heart(width / 2, height / 2, 3, 0));
  _i_max = 0;
}

void draw()
{
  background(255);
 
  if(_hearts.size() <= 0)
  {
    _i_max += 1;
    for(int i = 0; i < _i_max; i++)
    {
      for(float theta = 0; theta < 360 - 15; theta += 15)
      {
        float radius = 5 + i * 3;
        float x = radius * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
        float y = (-1) * radius * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta)) 
              - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta)));
        x += width / 2;
        y += height / 2;
        _hearts.add(new Heart(x, y, random(2, 2.5), 0));
      }
    }
  }
  
  Iterator<Heart> it = _hearts.iterator();
  while(it.hasNext())
  {
    Heart heart = it.next();
    heart.run();
    if(heart.isDead())
    {
      it.remove();
    }
  }

  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 640)
  {
     exit();
  }
  */
}