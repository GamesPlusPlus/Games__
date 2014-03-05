
import ddf.minim.*;
enemy walker, flyer;
boolean sketchFullScreen() {
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

void setup()
{
  l1= new Level(1);

  //size(displayWidth, displayHeight);
  size(500,500); //just for testing -W.Z.
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
  
  //new way of doing maps -W.Z.
  map1=createReader("map1.txt");
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


void draw() {
  switch (world) {
    //start screen
  case 0:
    starting.starts();
    instr.display();
    instr.update();
    break;
    //YOU LIED ITS MAGIC
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
    //SCI world

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
    break;
  }
}
  

