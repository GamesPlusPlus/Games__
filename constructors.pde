void constructors() {
  for (int i = 0; i < 9; i++) {
    blocks[i] = new Blocks_Class(i*50+25, 300);
  }
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

