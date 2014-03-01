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
}

void draw()
{
  test.display();
  rect(width/2,height/2+50,50,50);
}

boolean sketchFullScreen() {
  return true;
}
