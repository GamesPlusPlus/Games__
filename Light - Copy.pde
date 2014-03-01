//PImage img;
PImage black;


float playerx;
float playery;

void setup() {
  //size(480, 360);
  size(displayWidth,displayHeight)
  black=loadImage("Black3.png");
  imageMode(CENTER);
  rectMode(CENTER);
}

void draw() {
   //UNCOMMENT THESE FOR ZE GAME PLZ :D
  //float playerx=player.loc.x;
  //float playery=player.loc.y;
   playerx=mouseX;
   playery=mouseY;
  background(200,0,0);//Just for testing 
  fill(0,233,0);
  rect(100,100,100,100);

Light(true);
//Light(false);
}
void Light(boolean fire)
{
  if(fire)
  {
    image(black,playerx+25,playery+25);
  }
  else if(!fire)
  {
    fill(0);
    rect(0,0,displayWidth,displayHeight);
  }
}

