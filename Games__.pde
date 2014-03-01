Player player;
boolean aPressed = false;
boolean dPressed = false;
boolean spacePressed = false;
int world;
Blocks_Class[] blocks = new Blocks_Class[9];
PImage[][][] charPics = new PImage[2][4][2];
//array x is for the world: 0 = sci, 1 = magic

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  constructors();
  world = 1;
  player = new Player();
}

void draw() {
  background(0);
  for (int i = 0; i < blocks.length; i++) {
    blocks[i].display();
  }
  player.display();
  player.update();
}

void keyPressed() {
  switch (key) {
  case ' ':
    spacePressed = true;
    break;
  case 'a':
    aPressed = true;
    break;
  case 'd':
    dPressed = true;
    break;
  }
  player.update();
}

void keyReleased() {
  switch (key) {
  case ' ':
    spacePressed = false;
    break;
  case 'a':
    aPressed = false;
    break;
  case 'd':
    dPressed = false;
  }
}

