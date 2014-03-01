class Light_Bridge
{
  PVector loc, vel, acc;
  int angle;
  boolean death;
  Light_Bridge(int x, int y, boolean d)
  {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    loc.x = x;
    loc.y = y;
    death = d;
    rectMode(CENTER);
    imageMode(CENTER);
  }
  void display()
  {
    if (death==false)
    {
      image(bluelazer, loc.x+10, loc.y+5, 50, 50);
    }
    if (death==true)
    {
      image(redlazer, loc.x+10, loc.y+5, 50, 50);
    }
  }
  void bridge()
  {
  }
}

