Player player;
boolean aPressed = false;
boolean dPressed = false;
boolean spacePressed = false;
int world;
Blocks_Class[] blocks = new Blocks_Class[4];

void setup() {
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  player = new Player();
  world = 1;
  blocks[0] = new Blocks_Class(width/2, height/2 + 100);
  blocks[1] = new Blocks_Class(width/2 - 50, height/2 + 50);
  blocks[2] = new Blocks_Class(width/2 - 50, height/2 );
  blocks[3] = new Blocks_Class(width/2, height/2 - 50);
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

