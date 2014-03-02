import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import ddf.minim.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Games__ extends PApplet {



enemy walker, flyer;
public boolean sketchFullScreen() {
  return true;
}

Player player;
boolean aPressed = false;
boolean dPressed = false;
boolean spacePressed = false;
PImage[][][] charPics = new PImage[2][4][2];
//array x is for the world: 0 = sci, 1 = magic

Minim minim;
AudioPlayer song;
int  world, rot;
PImage duck, tank, bat, sci, mag;
Instruct instr;
startScreenStuff starting;
PImage redlazer;
PImage bluelazer;
Light_Bridge tests;
Blocks_Class test;
int DONT_INTERSECT = 0;
int COLLINEAR = 1;
int DO_INTERSECT = 2;
float x9, y9;
PImage black;
float x =0, y=0;
Level l1;

public void setup()
{
  l1= new Level(1);

  size(displayWidth, displayHeight);
  colorMode(HSB, 360, 100, 100, 100);
  rectMode(CENTER);
  imageMode(CENTER);
  //stuff to be declared
  duck = loadImage("Duck.jpg");
  tank = loadImage("Tank.png");
  bat = loadImage("Bat.png");
  sci = loadImage("Bg Science.png");
  mag = loadImage("Bg Magic.png");
  instr = new Instruct();
  starting = new startScreenStuff();
  world = 0;
  y = 1;
  x9 = 0;
  y9 = 0;
  rot = 5;
  minim = new Minim(this);//song set up
  song= minim.loadFile("Mozart.mp3");
  song.pause();
  song.play();
  walker = new enemy(width/2, height/2);
  flyer = new enemy(width/2, height/2);
  test = new Blocks_Class(width/2+100, height/2+50);
  bluelazer = loadImage("lazer1.png");
  redlazer = loadImage("lazer2.png");
  // this loads mysong.wav from the data folder
  tests= new Light_Bridge(width/2, height/2, false);
  black=loadImage("Black3.png");
  constructors();
  player = new Player();
}
//int intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
//
//    float a1, a2, b1, b2, c1, c2;
//    float r1, r2, r3, r4;
//    float denom, offset, num;
//
//    // Compute a1, b1, c1, where line joining points 1 and 2
//    // is "a1 x + b1 y + c1 = 0".
//    a1 = y2 - y1;
//    b1 = x1 - x2;
//    c1 = (x2 * y1) - (x1 * y2);
//
//    // Compute r3 and r4.
//    r3 = ((a1 * x3) + (b1 * y3) + c1);
//    r4 = ((a1 * x4) + (b1 * y4) + c1);
//
//    // Check signs of r3 and r4. If both point 3 and point 4 lie on
//    // same side of line 1, the line segments do not intersect.
//    if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)) {
//      return DONT_INTERSECT;
//    }
//
//    // Compute a2, b2, c2
//    a2 = y4 - y3;
//    b2 = x3 - x4;
//    c2 = (x4 * y3) - (x3 * y4);
//
//    // Compute r1 and r2
//    r1 = (a2 * x1) + (b2 * y1) + c2;
//    r2 = (a2 * x2) + (b2 * y2) + c2;
//
//    // Check signs of r1 and r2. If both point 1 and point 2 lie
//    // on same side of second line segment, the line segments do
//    // not intersect.
//    if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))) {
//      return DONT_INTERSECT;
//    }
//
//    //Line segments intersect: compute intersection point.
//    denom = (a1 * b2) - (a2 * b1);
//
//    if (denom == 0) {
//      return COLLINEAR;
//    }
//
//    if (denom < 0) { 
//      offset = -denom / 2;
//    } 
//    else {
//      offset = denom / 2 ;
//    }
//
//    // The denom/2 is to get rounding instead of truncating. It
//    // is added or subtracted to the numerator, depending upon the
//    // sign of the numerator.
//    num = (b1 * c2) - (b2 * c1);
//    if (num < 0) {
//      x = (num - offset) / denom;
//    } 
//    else {
//      x = (num + offset) / denom;
//    }
//
//    num = (a2 * c1) - (a1 * c2);
//    if (num < 0) {
//      y = ( num - offset) / denom;
//    } 
//    else {
//      y = (num + offset) / denom;
//    }
//
//    // lines_intersect
//    return DO_INTERSECT;
//  }


public void draw() {
  switch (world) {
    //start screen
  case 0:
    starting.starts();
    instr.display();
    instr.update();
    break;
    //science world
  case 1:
    background(0);
    image(mag, width/2, height/2, displayWidth, displayHeight);
    fill(100);
    //rect(width/2, height*1/4, width, height);
    flyer.fly();

    if (mousePressed) {
          world = 2;
     
    }
    //    playerx=player.loc.x;
    //    playery=player.loc.y;
    //    playerx=mouseX;
    //    playery=mouseY;
    //    Light(true);


    int intersected;
    //background(0);
    test.display();
    tests.display();
    tests.bridge();


    // lignes
    stroke(0);

    // ligne fixe
    line(tests.loc.x+17, tests.loc.y+2, tests.loc.x + 1000*cos(radians(tests.angle)), tests.loc.y + 1000*sin(radians(tests.angle)));

    // ligne en mouvement

    intersected = intersect(tests.loc.x+17, tests.loc.y+2, tests.loc.x + 1000*cos(radians(tests.angle)), tests.loc.y + 1000*sin(radians(tests.angle)), test.loc.x-25, test.loc.y-25, test.loc.x-25, test.loc.y+25);

    // dessiner le point d'intersection
    noStroke();
    if (intersected == DO_INTERSECT)
    {
      ellipse(x, y, 5, 5);
      if (tests.death)
      {
      }
    }


    // lignes
    stroke(0);

    // ligne fixe
    line(tests.loc.x+17, tests.loc.y+2, tests.loc.x + 1000*cos(radians(tests.angle)), tests.loc.y + 1000*sin(radians(tests.angle)));

    // ligne en mouvement

    intersected = intersect(tests.loc.x+17, tests.loc.y+2, tests.loc.x + 1000*cos(radians(tests.angle)), tests.loc.y + 1000*sin(radians(tests.angle)), test.loc.x-25, test.loc.y-25, test.loc.x-25, test.loc.y+25);

    // dessiner le point d'intersection
    noStroke();
    if (intersected == DO_INTERSECT)
    {
      ellipse(x, y, 5, 5);
      if (tests.death)
      {
      }
    }
    player.display();
    player.update();

    break;
    //magic world

  case 2:
    background(0);
    image(sci, width/2, height/2, displayWidth, displayHeight);
    //rectMode(CORNER);
    walker.walk();
    rectMode(CENTER);
    if (mousePressed) {
          world = 1;
    }
        
      
    
    player.display();
    player.update();
    break;
  case 3:
    instr.instructions();
    break;
  case 4:
    background(0);
    pushMatrix();
    translate(width/2, height/2);
    rotate(radians(rot));
    textSize(50);
    text("U L0SER \nl0l us sux \n l33t hax0rz", 0, 0);
    popMatrix();
    rot+=5;
    break;
  }
   if (world > 0 && world!= 3) {
   l1.display(); 
  }
}

public void keyPressed() {
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

public void keyReleased() {
  switch (key) {
  case ' ':
    spacePressed = false;
    break;
  case 'a':
    aPressed = false;
    break;
  case 'd':
    dPressed = false;
    break;
  }
}
  


public boolean button(float x_, float y_, float w, float h) {
  float x5 = x_ - w/2;
  float y5 = y_ - h/2;
  return (mousePressed && mouseX > x5 && mouseX < x5 + w&& mouseY > y5 && mouseY < y5 + h) ? true : false;
}

class startScreenStuff {

  startScreenStuff() {
  }

  public void starts() {
    background(0);
    textSize(20);
    fill(0, 0, 100);
    strokeWeight(5);
    stroke(240, 100, 100, 70);
    rect(width/2, height*7/18 + 7, width/2, height/9, 50);
    fill(240, 100, 100, 70);
    textAlign(CENTER);
    text("START THE GAME", width/2, height*7/18 + 7);
    textSize(100);
    fill(0, 100, 100);
    text("The Flip", width/2, height/4);
    world = (button(width/2, height*7/18 + 7, width/2, height/9)) ? 1:0;
  }
}

public int intersect(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {

  float a1, a2, b1, b2, c1, c2;
  float r1, r2, r3, r4;
  float denom, offset, num;

  // Compute a1, b1, c1, where line joining points 1 and 2
  // is "a1 x + b1 y + c1 = 0".
  a1 = y2 - y1;
  b1 = x1 - x2;
  c1 = (x2 * y1) - (x1 * y2);

  // Compute r3 and r4.
  r3 = ((a1 * x3) + (b1 * y3) + c1);
  r4 = ((a1 * x4) + (b1 * y4) + c1);

  // Check signs of r3 and r4. If both point 3 and point 4 lie on
  // same side of line 1, the line segments do not intersect.
  if ((r3 != 0) && (r4 != 0) && same_sign(r3, r4)) {
    return DONT_INTERSECT;
  }

  // Compute a2, b2, c2
  a2 = y4 - y3;
  b2 = x3 - x4;
  c2 = (x4 * y3) - (x3 * y4);

  // Compute r1 and r2
  r1 = (a2 * x1) + (b2 * y1) + c2;
  r2 = (a2 * x2) + (b2 * y2) + c2;

  // Check signs of r1 and r2. If both point 1 and point 2 lie
  // on same side of second line segment, the line segments do
  // not intersect.
  if ((r1 != 0) && (r2 != 0) && (same_sign(r1, r2))) {
    return DONT_INTERSECT;
  }

  //Line segments intersect: compute intersection point.
  denom = (a1 * b2) - (a2 * b1);

  if (denom == 0) {
    return COLLINEAR;
  }

  if (denom < 0) { 
    offset = -denom / 2;
  } 
  else {
    offset = denom / 2 ;
  }

  // The denom/2 is to get rounding instead of truncating. It
  // is added or subtracted to the numerator, depending upon the
  // sign of the numerator.
  num = (b1 * c2) - (b2 * c1);
  if (num < 0) {
    x9 = (num - offset) / denom;
  } 
  else {
    x9 = (num + offset) / denom;
  }

  num = (a2 * c1) - (a1 * c2);
  if (num < 0) {
    y9 = ( num - offset) / denom;
  } 
  else {
    y9 = (num + offset) / denom;
  }

  // lines_intersect
  return DO_INTERSECT;
}


public boolean same_sign(float a, float b) {

  return (( a * b) >= 0);
}
public void Light(boolean fire)
{
  if (fire)
  {
    rectMode(CORNER);
    fill(0);
    image(black, player.loc.x+25, player.loc.y+25);
    rect(0,0,player.loc.x - 200, height);
    rect(player.loc.x +200, 0, width, height);
    rect(0,0,width,player.loc.y - 250);
  }
  else if (!fire)
  {
    fill(0);
    rect(0, 0, displayWidth, displayHeight);
  }
}

class enemy {
  PVector loc, vel, vel2;
  float distance, distance2, tolerance;

  enemy(float x, float y) {
    loc = new PVector(x, y);
    vel = new PVector(2, 0);
    vel2 = new PVector(0, 2);
    distance = loc.x;
    distance2 = loc.y;
    tolerance = 100;
  }

  public void walk() {
    image(tank, loc.x, loc.y);
    loc.add(vel);
    if (loc.x > distance + tolerance) {
      vel.mult(-1);
    }
    if (loc.x < distance - tolerance) {
      vel.mult(-1);
    }
  }

  public void fly() {
    image(bat, loc.x, loc.y);
    loc.add(vel2);
    if (loc.y > distance2 + tolerance) {
      vel2.mult(-1);
    }
    if (loc.y < distance2 - tolerance) {
      vel2.mult(-1);
    }
  }
}
class Instruct {

  Instruct() {
  }

  public void display() {
    //shows instructions/rules tab    
    colorMode(HSB, 360, 100, 100);
    textSize(20);
    fill(120, 100, 100);
    strokeWeight(5);
    stroke(240, 100, 100, 70);
    rect(width/2, height*11/18, width/2, height/9, 50);
    fill(240, 100, 100, 70);
    textAlign(CENTER);
    text("RULES & INSTRUCTIONS", width/2, height*11/18);
  }

  public void update() {
    //changes to rules tab    
    if (button(width/2, height*11/18, width/2, height/9)) {
      world = 3;
    }
  }

  public void instructions() {
    //displays button
    background(0);
    fill(120, 100, 100);
    rect(width/2, height*13/18, width/2, height/9, 50);
    fill(240, 100, 100, 70);
    text("RETURN", width/2, height*13/18);
    if (button(width/2, height*13/18, width/2, height/9)) {
      world = 0;
    }
    fill(240, 100, 100);
    fill(0, 100, 100);
    //display instructions
    text("In this game, the player is attempting to escape the city before time runs out! \nMove with WASD, jump with space, and interact with the world with your mouse. \nUse enter and control to flip in between the magic and science worlds. /nIn each world, you have different abilities. Use them to help you escape!/n We Apologize for the extremely unfinished product. This was our first attempt at a game jam and we overestimated the amount we could accomplish.\n We had created classes for light bridges, lasers, enemies, falling, and portaling between the two. Functions for spells, lights, caves, and puzzles were created. Instead we have this./n Maybe we will finish this game one day!", width/2, height/9);
    //image(duck, width/2, height*7/18, duck.width*3, duck.height*3);
    //text("Le Quack approves", width/2, height*11/18);
  }
}
class Level {
  boolean[][][] bools = new boolean[2][20][6];
  Blocks_Class[][][] blocks = new Blocks_Class[2][20][6];
  PVector spawn = new PVector();

  Level(int l) {
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 20; j++) {
        for (int k = 0; k < 6; k++) {
          blocks[i][j][k] = null;
          bools[i][j][k] = false;
        }
      }
    }
    switch(l) {
    case 1:
      for (int i=0;i<20;i++)
      {
        bools[1][i][0]=true;
      }
      bools[1][1][1]=true;
      bools[1][2][1]=true;
      bools[1][3][1]=true;
      bools[1][6][1]=true;
      bools[1][7][1]=true;
      bools[1][9][1]=true;
      for (int i=10; i<20; i++)
      {
        bools[1][i][1]=true;
      }
      bools[1][3][2]=true;
      bools[1][6][2]=true;
      bools[1][7][2]=true;
      bools[1][9][2]=true;
      bools[1][13][2]=true;
      bools[1][14][2]=true;
      bools[1][7][3]=true;
      bools[1][13][3]=true;

      bools[0][6][3] = true;
      bools[0][6][4]=true;
      for (int i=0; i<20; i++)
      {
        bools[0][i][0]=true;
      }
      bools[0][1][1]=true;
      bools[0][2][1]=true;
      bools[0][4][1]=true;
      for (int i=4;i<13;i++)
      {
        bools[0][i][1]=true;
      }
      for (int i=16;i<20;i++)
      {
        bools[0][i][1]=true;
      }

      for (int i=4;i<13;i++)
      {
        bools[0][i][2]=true;
      }
      for (int i=10;i<13;i++)
      {
        bools[0][i][2]=true;
      }
      for (int i=16;i<20;i++)
      {
        bools[0][i][2]=true;
      }

      bools[0][12][2]=true;
      bools[0][13][2]=true;
      for (int i=16;i<20;i++)
      {
        bools[0][i][3]=true;
      }
      break;
    }
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 20; j++) {
        for (int k = 0; k < 6; k++) {
          if (bools[i][j][k]) {
            blocks[i][j][k] = new Blocks_Class(25 + (50 * j) + 500, height -( 25 + 50 * k)+800);
          }
        }
      }
    }
  }

  public void display() {
    for (int j = 0; j < 20; j++) {
      for (int k = 0; k < 6; k++) {
        if (bools[world-1][j][k]) {
          blocks[world-1][j][k].display();
        }
      }
    }
  }
}

class Light_Bridge
{
  PVector loc, vel, acc;
  int angle;
  boolean death;
  Light_Bridge(int x, int y, boolean d)
  {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    loc.x = x;
    loc.y = y;
    death = d;
    rectMode(CENTER);
    imageMode(CENTER);
  }
  public void display()
  {
    if (death==false)
    {
      image(bluelazer, loc.x+10, loc.y+5, 50, 50);
    }
    if (death==true)
    {
      image(redlazer, loc.x+10, loc.y+5, 50, 50);
    }
  }
  public void bridge()
  {
  }
}

class Time {
  int oldTime, newTime;
  
  Time() {
  }
  
  public void timed() {
  }
}
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

  public void display() {
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

  public void update() {
    if (player.tall/2 + size/2 >= abs(player.loc.y - loc.y)) { // if it within y range of the block or standing on the block
      if (!(abs(player.loc.x - loc.x) >= size/2 + player.fat/2)) {// if it is stnding on the block but within x range
        player.standing = true;
        if (player.loc.y > loc.y) {
          player.loc.y = loc.y+56;
        }
        else {
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

public void constructors() {
 
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

  public void update() {
    
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
      acc = new PVector(0, .21f);
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
  public void display() {
    if (img == null) {
      img = charPics[world-1][0][facing];
    }
    //    fill(360);
    //    rect(loc.x, loc.y, fat, tall);
    image(img, loc.x, loc.y, (fat*2), tall);
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--hide-stop", "Games__" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
