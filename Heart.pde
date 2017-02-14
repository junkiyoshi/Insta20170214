class Heart
{
  PVector location;
  float radius;
  float direction;
  float min_radius;
  float max_radius;
  float angle;
  color body_color;
  float life_span;
  
  Heart(float x, float y, float r, float a)
  {
    location = new PVector(x, y);
    radius = random(0.5, r * 0.5);
    direction = (random(100) > 50) ? -0.1 : 0.1;
    min_radius = 0.5;
    max_radius = r;
    angle = a;
    body_color = color(random(200, 255), random(0, 100), random(0, 100));
    life_span = 255;
  }
  
  void run()
  {
    update();
    display();
  }
  
  void update()
  {
    radius = radius + direction;
    if(radius >= max_radius || radius <= min_radius)
    {
      direction *= -1;
    }
    life_span -= 2;
  }
  
  void display()
  {
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(angle));
    
    fill(body_color, life_span);
    
    _h.beginShape();
    for (int theta = 0; theta < 360; theta++) 
    {
      float x = radius * (16 * sin(radians(theta)) * sin(radians(theta)) * sin(radians(theta)));
      float y = (-1) * radius * (13 * cos(radians(theta)) - 5 * cos(radians(2 * theta)) 
        - 2 * cos(radians(3 * theta)) - cos(radians(4 * theta)));
  
      _h.vertex(x, y);
    }
    
    _h.endShape(CLOSE);    
    popMatrix();
  }
  
  boolean isDead()
  {
    if(life_span < 0)
    {
      return true;
    }
    
    return false;
  }
}