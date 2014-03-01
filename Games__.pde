int world;
Instruct instr;
startScreenStuff starting;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  //stuff to be declared
  instr = new Instruct();
  starting = new startScreenStuff();
  world = 0;
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

