Player player;

void setup() {
  rectMode(CORNER);
  colorMode(HSB, 360, 100, 100);
  size(500, 500);
  player = new Player();
}

void draw() {
  background(0);
  player.display();
}

void keyPressed() {
  player.update();
}

