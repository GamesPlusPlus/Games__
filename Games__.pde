<<<<<<< HEAD
Blocks_Class test;
void setup()
{
  size(width/2, height/2);
  test = new Blocks_Class(width/2, height/2);
=======
import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
PImage redlazer;
PImage bluelazer;
Light_Bridge test;
 
void setup()
{
  size(displayWidth, displayHeight);
  minim = new Minim(this);//song set up
  song= minim.loadFile("Mozart.mp3");
  song.pause();
  song.play();
  bluelazer = loadImage("lazer1.png");
  redlazer = loadImage("lazer2.png");
  // this loads mysong.wav from the data folder
  test= new Light_Bridge(width/2,height/2,false);
>>>>>>> refs/heads/Light-bridge
}

void draw()
{
<<<<<<< HEAD
  background(0);
  test.display();
=======
  test.display();
  rect(width/2,height/2+50,50,50);
>>>>>>> refs/heads/Light-bridge
}

boolean sketchFullScreen() {
  return true;
}
