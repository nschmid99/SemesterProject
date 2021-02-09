//Natasha Schmid CRCP 4391
//Semester Project
//camera setup from processing tutorial
//https://processing.org/tutorials/video/

import processing.video.*;
Movie mov;
static final String movFile = "rdj.mov";
ArrayList blckPixels;

void setup() {
  size(640, 360);

  mov = new Movie(this, movFile);
  mov.play();
  blckPixels=new ArrayList();
}

void movieEvent(Movie mov) {
  mov.read();
}

void draw() {  
  //background(0);
  if (frameCount % 60 == 0) {
    image(mov, 0, 0);
    manPix();
  }
}

void manPix() {
  loadPixels();
  mov.loadPixels();

  //cycle through pixels
  for (int y=0; y < mov.height; y++) {
    for (int x=0; x < mov.width; x++) {
      color pc=mov.get(x, y);  //look at color of pixels

      //get all pixels 
      int loc = x+y*width; 
      x=loc % mov.width;  //get xpos
      y=loc /mov.width;  //get ypos
      float redVal = red(pc);  //reads red value!

//println(redVal);
      if (redVal==157.0) { //
       // println(x, "x", y, "y");
        //fill(255);
        blckPixels.add(new PVector(x, y));
        println(blckPixels.size());
        //circle(x,y,10);
        //println(loc);
      }

      //for color value this
      //get location of pixel. 
      //save as xpov,ypoc
      //draw circle there
    }
  }
}
