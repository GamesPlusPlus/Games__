boolean button(float x_, float y_, float w, float h) {
  float x = x_ - w/2;
  float y = y_ - h/2;
  return (mousePressed && mouseX > x && mouseX < x + w&& mouseY > y && mouseY < y + h) ? true : false;
}

class startScreenStuff {

  startScreenStuff() {
  }
  
  void starts() {
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
