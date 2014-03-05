/*class Player {
  int hp, maxhp;
  int mana, maxMana;
  int step;
  float jump;
  float fall;
  int tall, fat;
  PVector loc, vel, acc;
  boolean standing, jumping;
  boolean allowLeft, allowRight;
  int facing; //0 is left, 1 is right
  int lastJump, jumpCD;
  PImage img;
  int walking = 0;
  Player() {
    facing = 0;
    lastJump = 0;
    jumpCD = 500;
    standing = true;
    tall = 80;
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
    for (int j = 0; j < 20; j++) {
      for (int k = 0; k < 6; k++) {
        if(world !=0)
        {
        if (l1.bools[world-1][j][k]) {
          l1.blocks[world-1][j][k].update();
        }
      }
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
      facing = aPressed ? 1 : facing;
      loc.x = (loc.x < 0) ? loc.x + step : loc.x;
    }
    if (allowRight) {
      loc.x = dPressed ? loc.x + step : loc.x;
      facing = dPressed ? 0 : facing;
      loc.x = (loc.x > width) ? loc.x - step : loc.x;
    }
    if (aPressed || dPressed && standing) {
      walking++;
    }
    if(world!=0)
    {
    img = charPics[world-1][(walking / 10) % 4][facing];
    //for testing only
    if (loc.y > height) {
      loc = new PVector(width/2, height/2);
    }
    vel.add(acc);
    loc.add(vel);
  }
    }
  }
  void display() {
    if (img == null) {
      img = charPics[world-1][0][facing];
    }
    //    fill(360);
    //    rect(loc.x, loc.y, fat, tall);
    image(img, loc.x, loc.y, (fat*2), tall);
  }
}*/
class Player {
  int hp, maxhp;
  int mana, maxMana;
  int step;
  float jump, fall;
  int tall, fat;
  PVector loc, vel, acc;
  boolean standing;
  boolean allowLeft, allowRight;
  boolean aPressed, dPressed, spacePressed;
  int facing; //0 is left, 1 is right
  int lastJump, jumpCD;
  PImage img;
  int walking = 0;
  Player() {
    facing = 0;
    lastJump = 0;
    jumpCD = 500;
    standing = true;
    tall = 80;
    fat = 30;
    step = 5;
    jump = 10;
    maxhp = 100;
    hp = maxhp;
    maxMana = 100;
    mana = 100;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    aPressed = false;
    dPressed = false;
    spacePressed = false;

    //construct PImages
    charPics[0][0][0] = loadImage("walk(0)(0).png");
    charPics[0][1][0] = loadImage("walk(0)(1).png");
    charPics[0][2][0] = loadImage("walk(0)(2).png");
    charPics[0][3][0] = loadImage("walk(0)(3).png");
    charPics[1][0][0] = loadImage("walk(1)(0).png");
    charPics[1][1][0] = loadImage("walk(1)(1).png");
    charPics[1][2][0] = loadImage("walk(1)(2).png");
    charPics[1][3][0] = loadImage("walk(1)(3).png");

    charPics[0][0][1] = loadImage("walk(0)(0) - Copy.png");
    charPics[0][1][1] = loadImage("walk(0)(1) - Copy.png");
    charPics[0][2][1] = loadImage("walk(0)(2) - Copy.png");
    charPics[0][3][1] = loadImage("walk(0)(3) - Copy.png");
    charPics[1][0][1] = loadImage("walk(1)(0) - Copy.png");
    charPics[1][1][1] = loadImage("walk(1)(1) - Copy.png");
    charPics[1][2][1] = loadImage("walk(1)(2) - Copy.png");
    charPics[1][3][1] = loadImage("walk(1)(3) - Copy.png");
  }

  void update() {
    standing = false;
    allowRight = true;
    allowLeft = true;
    for (int i = 0; i <2; i++) {
      for(int j=0;j<20;j++)//the numbers must be changed by level later
      {
        for(int k=0;k<6;k++)
        {
          l1.blocks[i][j][k].update();
        }
      }
    }
    vel.x = 0;
    if (standing) {
      vel.y = 0;
      acc = new PVector(0, 0);
    } 
    else {
      acc = new PVector(0, .21);
    }
    if (spacePressed && standing && (millis()- lastJump > jumpCD)) {
      lastJump = millis();
      vel.y = -5;
    }
    if (allowLeft) {
      loc.x = (loc.x < 0) ? loc.x + step : loc.x;
    }
    if (allowRight) {
      loc.x = (loc.x > width) ? loc.x - step : loc.x;
    }
    if (allowLeft && aPressed && !dPressed) {
      vel.x = -step;
      facing = 1;
    }
    if (allowRight && !aPressed && dPressed) {
      vel.x = step;
      facing = 0;
    }
    if (aPressed || dPressed && standing) {
      walking++;
    }
    img = charPics[world-1][(walking / 10) % 4][facing];
    //for testing only
    if (loc.y > height) {
      loc = new PVector(width/2, height/2);
    }
    vel.add(acc);
    loc.add(vel);
  }

  void display() {
    if (img == null) {
      img = charPics[world-1][0][facing];
    }
    image(img, loc.x, loc.y, (fat*2), tall);
  }

  void playerKeyPressed() {
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
    update();
  }

  void playerKeyReleased() {
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
    update();
  }
}

