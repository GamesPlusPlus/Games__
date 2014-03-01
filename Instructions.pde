class Instruct {

  Instruct() {
  }

  void display() {
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

  void update() {
    //changes to rules tab    
    if (button(width/2, height*11/18, width/2, height/9)) {
      world = 3;
    }
  }

  void instructions() {
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
    text("The Flip is game inspired by Portal and The Legend of Zelda: A Link to the Past.", width/2, height/9);
  }
}
