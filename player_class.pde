class Player {
  int hp, maxhp;
  int mana, maxMana;
  int step, jump;
  PVector loc;

  Player() {
    step = 5;
    jump = 20;
    maxhp = 100;
    hp = maxhp;
    maxMana = 100;
    mana = 100;
    loc = new PVector(width/2, height/2);
  }

  void update() {
    switch (key) {
    case ' ':
      if (spacePressed) {
        jump();
        loc.y = (loc.y < 0) ? loc.y + jump : loc.y;
      }
      break;
    case 'a':
      loc.x = aPressed ? loc.x - step : loc.x;
      loc.x = (loc.x < 0) ? loc.x + step : loc.x; 
      break;
    case 'd':
      loc.x = dPressed ? loc.x + step : loc.x;
      loc.x = (loc.x > width) ? loc.x - step : loc.x;
      break;
    }
  }

  void display() {
    fill(360);
    rect(loc.x, loc.y, 50, 50);
  }

  void jump() {
    loc.y -= jump;
  }
}

