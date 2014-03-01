int world;

boolean sketchFullScreen() {
  return true;
}

void setup() {
  size(displayWidth,displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
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
    rect(width/2, height*7/18 + 7, width/2, height/9);
    fill(240, 100, 100, 70);
    textAlign(CENTER);
    text("START THE GAME", width/2, height*7/18 + 7);
    textSize(100);
    fill(0, 100, 100);
    text("CAVES OF STEEL", width/2, height/4);
    world = (button(width/4, height/3, width/2, height/9)) ? 1:0;
    break;
  case 1:
    background(0);
    text("SCIENCE", width/2, height/2);
    break;
  case 2:
    background(0);
    break;
  }
}

