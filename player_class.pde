class Player {
  int hp, maxhp;
  int mana, maxMana;
  int step, jump;
  int tall, fat;
  PVector loc;
  boolean standing;
  int lastJump, jumpCD;

  Player() {
    lastJump = 0;
    jumpCD = 500;
    standing = true;
    tall = 60;
    fat = 30;
    step = 5;
    jump = 20;
    maxhp = 100;
    hp = maxhp;
    maxMana = 100;
    mana = 100;
    loc = new PVector(width/2, height/2);
  }

  void update() {
    standing = false;
    for (int i = 0; i < blocks.length; i++) {
      blocks[i].update();
    }
    if (!standing) {
      loc.y += jump;
    }
    if (spacePressed && standing && (millis()- lastJump > jumpCD)) {
      lastJump = millis();
      jump();
      loc.y = (loc.y < 0) ? loc.y + jump : loc.y;
    }
    loc.x = aPressed ? loc.x - step : loc.x;
    loc.x = (loc.x < 0) ? loc.x + step : loc.x; 
    loc.x = dPressed ? loc.x + step : loc.x;
    loc.x = (loc.x > width) ? loc.x - step : loc.x;
    
    //for testing only
    if (loc.y > height) {
     loc = new PVector(width/2, height/2); 
    }
  }

  void display() {
    fill(360);
    rect(loc.x, loc.y, fat, tall);
  }    

  void jump() {
    loc.y -= jump;
  }
}

