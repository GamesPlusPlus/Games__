boolean button(float x, float y, float w, float h) {
  return (mousePressed && mouseX > x && mouseX < x + w&& mouseY > y && mouseY < y + h) ? true : false;
}

boolean button2(float x, float y, float w, float h) {
  return (mouseX > x && mouseX < x + w&& mouseY > y && mouseY < y + h) ? true : false;
}
