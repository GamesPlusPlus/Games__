Player player;
boolean aPressed = false;
boolean dPressed = false;
boolean spacePressed = false;

void setup() {
  rectMode(CENTER);
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  player = new Player();
}

void draw() {
  background(0);
  player.display();
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

