//changing how the maps are created -W.Z.

//goes into setup:
//  map1=createReader("map1.txt");

BufferedReader map1;
String line;
void Maps ()
{
  try
  {
      line = map1.readLine();
  } 
  catch (IOException e)//just in case an error occurs.
  {
     e.printStackTrace();
     line = null;
  }
  if (line == null) {
      // Stop reading because of an error or file is empty
      noLoop();  
    } 
  else 
  {
      String[] pieces = split(line, ',');
      for(int i=0;i<pieces.length;i++)
      {
        if(pieces[i]=="-")
        {
          //no block
          println("air");
        }
        else if(pieces[i]=="b")//well this failed so far.
        {
          //block
          println("block");
        }
      }
      //int x = int(pieces[0]);
      //int y = int(pieces[1]);
     // point(x, y);
  }
}
