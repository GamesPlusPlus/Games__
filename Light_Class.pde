class Light_Bridge
{
  PVector loc,vel,acc;
  int angle;
  boolean death;
  Light_Bridge(int x, int y, boolean d)
  {
    angle = 0;
    loc = new PVector(x,y);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
    loc.x = x;
    loc.y = y;
    death = d;
    rectMode(CENTER);
    imageMode(CENTER);
    colorMode(HSB,360,100,100);
  }
  void display()
  {
    if(death==false)
    {
      image(bluelazer,loc.x+10,loc.y+5,50,50);
    }
    if(death==true)
    {
      image(redlazer,loc.x+10,loc.y+5,50,50);
    }
  }
  void bridge()
  {
    strokeWeight(6);
    stroke(238,90,79);
    line(loc.x+17, loc.y+2,loc.x + 1000*cos(radians(angle)),loc.y + 1000*sin(radians(angle))); 
    angle++;
  }
}

