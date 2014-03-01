class Blocks_Class {
  PVector loc, vel, acc;
  int size;

  Blocks_Class (float x, float y) {
    colorMode(HSB, 360, 100, 100);
    loc = new PVector();
    vel = new PVector();
    acc = new PVector();
    loc.x = x;
    loc.y = y;
    size = 50;
  }

  void display() {
    switch (world) {
    case 1:
      fill(100, 100, 100);
      break;
    case 2:
      fill(100, 100, 100);
      break;
    }
    rectMode(CENTER);
    rect(loc.x, loc.y, size, size);
  }

  void update() {
    if (player.tall/2 + size/2 >= abs(player.loc.y - loc.y)) {
      if (!(abs(player.loc.x - loc.x) >= size/2 + player.fat/2)) {
        player.standing = true;
        player.loc.y = loc.y - player.tall/2 - size/2;
      }
    }
  }
}

