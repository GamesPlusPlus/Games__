Blocks_Class test;
void setup()
{
  size(width/2, height/2);
  test = new Blocks_Class(width/2, height/2);
}

void draw()
{
  background(0);
  test.display();
}

boolean sketchFullScreen() {
  return true;
}
