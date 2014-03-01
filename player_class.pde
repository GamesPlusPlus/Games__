class Player {
  int hp, maxhp;
  int mana, maxMana;
  int step;
  float jump;
  float fall;
  int tall, fat;
  PVector loc, vel, acc;
  boolean standing, jumping;
  boolean allowLeft, allowRight;
  int lastJump, jumpCD;

  Player() {
    lastJump = 0;
    jumpCD = 500;
    standing = true;
    tall = 60;
    fat = 30;
    step = 5;
    jump = 5;
    maxhp = 100;
    hp = maxhp;
    maxMana = 100;
    mana = 100;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  void update() {
    standing = false;
    allowRight = true;
    allowLeft = true;
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].update();
    }
    if (standing) {
      vel.y = 0;
      acc = new PVector(0, 0);
    } 
    else {
      acc = new PVector(0, .21);
    }
    if (spacePressed && standing && (millis()- lastJump > jumpCD)) {
      lastJump = millis();
      acc.y = (loc.y < 0) ? -jump : 0;
      vel.y = -6;
    }
    if (!standing && !jumping) {
      loc.y += jump/10;
    }
    if (allowLeft) {
      loc.x = aPressed ? loc.x - step : loc.x;
      loc.x = (loc.x < 0) ? loc.x + step : loc.x;
    }
    if (allowRight) {
      loc.x = dPressed ? loc.x + step : loc.x;
      loc.x = (loc.x > width) ? loc.x - step : loc.x;
    }

    //for testing only
    if (loc.y > height) {
      loc = new PVector(width/2, height/2);
    }
    vel.add(acc);
    loc.add(vel);
  }

  void display() {
    fill(360);
    rect(loc.x, loc.y, fat, tall);
  }
}

