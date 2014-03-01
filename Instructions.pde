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
    text("In this game, the player is attempting to escape the city before time runs out! \nMove with WASD, jump with space, and interact with the world with your mouse. \nUse enter and control to flip in between the magic and science worlds. \nIn each world, you have different abilities. Use them to help you escape!", width/2, height/9);
    image(duck, width/2, height*7/18, duck.width*3, duck.height*3);
  }
}
