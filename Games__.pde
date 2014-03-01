int world;
Instruct instr;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  //stuff to be declared
  instr = new Instruct();
  world = 0;
}

void draw() {
  switch (world) {
    //start screen
  case 0:
    background(0);
    textSize(20);
    fill(0, 0, 100);
    strokeWeight(5);
    stroke(240, 100, 100, 70);
    rect(width/2, height*7/18 + 7, width/2, height/9, 50);
    fill(240, 100, 100, 70);
    textAlign(CENTER);
    text("START THE GAME", width/2, height*7/18 + 7);
    textSize(100);
    fill(0, 100, 100);
    text("The Flip", width/2, height/4);
    world = (button(width/2, height*7/18 + 7, width/2, height/9)) ? 1:0;
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

