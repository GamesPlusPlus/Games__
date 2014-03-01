import ddf.minim.*;

boolean sketchFullScreen() {
  return true;
}

Minim minim;
AudioPlayer song;
int y, world, rot;
PImage duck;
Instruct instr;
startScreenStuff starting;

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  imageMode(CENTER);
  //stuff to be declared
  duck = loadImage("Duck.jpg");
  instr = new Instruct();
  starting = new startScreenStuff();
  world = 0;
  y = 1;
  rot = 5;
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
    case 4:
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(rot));
    textSize(50);
    text("U L0SER \nl0l us sux \n l33t hax0rz", 0, 0);
    popMatrix();
    rot+=5;
    break;
  }
}

