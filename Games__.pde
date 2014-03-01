import ddf.minim.*;

Minim minim;
AudioPlayer song;
PImage redlazer;
PImage bluelazer;
Light_Bridge tests;
Blocks_Class test;

void setup()
{
  size(displayWidth, displayHeight);
  minim = new Minim(this);//song set up
  song= minim.loadFile("Mozart.mp3");
  song.pause();
  song.play();
  test = new Blocks_Class(width/2, height/2+50);
  bluelazer = loadImage("lazer1.png");
  redlazer = loadImage("lazer2.png");
  // this loads mysong.wav from the data folder
  tests= new Light_Bridge(width/2, height/2, false);
}

void draw()
{
    //background(0);
    test.display();
    tests.display();
    tests.bridge();
  rect(width/2, height/2+50, 50, 50);
}

boolean sketchFullScreen() {
  return true;
}

