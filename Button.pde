boolean button(float x_, float y_, float w, float h) {
  float x = x_ - w/2;
  float y = y_ - h/2;
  return (mousePressed && mouseX > x && mouseX < x + w&& mouseY > y && mouseY < y + h) ? true : false;
}
