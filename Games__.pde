import ddf.minim.*;

boolean sketchFullScreen() {
  return true;
}

Minim minim;
AudioPlayer song;
int y;
int world;
Instruct instr;
startScreenStuff starting;

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  //stuff to be declared
  instr = new Instruct();
  starting = new startScreenStuff();
  world = 0;
  y = 1;
  minim = new Minim(this);//song set up
  song= minim.loadFile("Mozart.mp3");
  song.pause();
  song.play();
}

void draw() {
  switch (world) {
    //start screen
  case 0:
    starting.starts();
    instr.display();
    instr.update();
    break;
    //science world
  case 1:
    background(0);
    text("SCIENCE", width/2, height/2);
    break;
    //magic world
  case 2:
    background(0);
    break;
  case 3:
    instr.instructions();
    break;
  }
}

