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
    if (player.tall/2 + size/2 >= abs(player.loc.y - loc.y)) { // if it within y range of the block or standing on the block
      if (!(abs(player.loc.x - loc.x) >= size/2 + player.fat/2)) {// if it is stnding on the block but within x range
        player.standing = true;
        if(player.loc.y > loc.y)
        {
          player.loc.y = loc.y+56;
        }
        else
        {
          player.loc.y = loc.y - player.tall/2 - size/2;
        }
        
        player.vel.y = 0;
      }
    }
    if (player.tall/2 + size/2 > abs(player.loc.y - loc.y)) { // if it within y range of the block and not standing on it
      if (abs(player.loc.x - loc.x) - player.fat/2 - size/2 <= 0) { //if it is not standing on the block but within x range
        if (player.loc.x < loc.x) { //if it's to the left of the block
          player.allowRight = false;
        }
        if (player.loc.x > loc.x) { //if it's to the right
          player.allowLeft = false;
        }
      }
    }
  }
}

