//Natasha Schmid CRCP 4391
//Semester Project
//camera setup from processing tutorial
//https://processing.org/tutorials/video/

import processing.video.*;    //processing video library
Movie mov;  //create movie object
static final String movFile = "rdj.mov";  //video file located in the data folder
ArrayList bPixels;  //arraylist to store pixels

void setup() {
  size(640, 360);  //size of video clip
  mov = new Movie(this, movFile);  //instantiate movie
  mov.play();  //play movie
  bPixels=new ArrayList();  //create array list
}


void movieEvent(Movie mov) {
  mov.read();  //reads the frame
}

void draw() {  
    image(mov, 0, 0);
    manipPix();
}

void manipPix() {
  loadPixels();  //load pixels
  mov.loadPixels();  //load pixels of the movie

  //cycle through pixels of movie
  for (int y=0; y < mov.height; y++) {
    for (int x=0; x < mov.width; x++) {
      
     

      //get position of all pixels 
      int loc = x+y*width; //get the position of a pixel
      x=loc % mov.width;  //get xpos
      y=loc / mov.width;  //get ypos
      
      color pc=mov.get(x, y);  //look at color of pixels at that position
      
      float redVal = red(pc);  //reads red value from hex code
      float greenVal = green(pc);//reads green value from hex code

      if (redVal==157.0 && greenVal==155.0) { //just a test so chose color as a parameter
        PVector pixVect=new PVector(x, y);  //put the x and y in a pvector
        bPixels.add(pixVect);  //save the vector in the arraylist
        println(bPixels.size());  //check to make sure there are values

        if (bPixels.size() <70){  //make sure array list doesn't get too large
          for (int j=1; j<bPixels.size(); j++) {  //cycle through  array list

            PVector curPt = (PVector)bPixels.get(j);  //current pixel that met the reqs
            PVector prevPt = (PVector)bPixels.get(j-1); //prev pixel that met the reqs
            float xCurP = curPt.x;  //x val of current pixel
            float yCurP = curPt.y;  //y val of current pixel
            float xPrevP = prevPt.x;  //x val of previous pixel
            float yPrevP = prevPt.y;  //y val of previous pixel
            strokeWeight(8);  //make the line thicker
            stroke(pc/j);  //changing the color purely so its easier to see in this prototype
            line(xCurP, yCurP, xPrevP, yPrevP);  //draw lines between current and previous pixels
          }
         
        }
        else{
          bPixels.clear();  //clear arraylist when it gets too big
        }
      }
    }
  }
}
