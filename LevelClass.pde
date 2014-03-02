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

  void display() {
    for (int j = 0; j < 20; j++) {
      for (int k = 0; k < 6; k++) {
        if (bools[world-1][j][k]) {
          blocks[world-1][j][k].display();
        }
      }
    }
  }
}
