import ddf.minim.*;
 
Minim minim;
AudioPlayer song;
int y;
 
void setup()
{
  size(100, 100);
 y = 1;
  minim = new Minim(this);//song set up
  song= minim.loadFile("Mozart.mp3");
  song.pause();
  song.play();
 
  // this loads mysong.wav from the data folder
}

void draw()
{
  background(0);
}
