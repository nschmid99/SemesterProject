//Natasha Schmid CRCP 4391
//Semester Project
//camera setup from processing tutorial
//https://processing.org/tutorials/video/

import processing.video.*;    //processing video library
Movie mov;  //create movie object
static final String movFile = "rdj.mov";  //video file located in the data folder
ArrayList bPixels;  //arraylist to store pixels
PImage mask;
int[] pixels;
PVector location;
int PSIZE = 4;
int nmbrParticles = 100;
int x;
int y;
Particle particles[] = new Particle[nmbrParticles];


void setup() {
  size(640, 360);  //size of video clip
  mov = new Movie(this, movFile);  //instantiate movie
  mov.play();  //play movie
  bPixels=new ArrayList();  //create array list
  mask = loadImage("Acopy.jpeg");  //creates a mask from the image
  
}

void drawParticles(int nbrParts, PImage m){
  
  m.loadPixels();  //loads the pixels from the image
  fill(255,0,0);  //currently just making them red so its easier to see
  
  for(int i=0;i<300;i++){  //currently just a random value. will be replaced with something else
  x = (int)random(m.width);  //pick a random part inside mask
  y = (int) random(m.height); //pick a random part inside mask
  
if(red(m.get(x,y))>128){  //if its not white

  point(x,y);  // draw a point
  nbrParts--;
  
  }
  if(nbrParts<=0) break;  //break the for loop
  }
}


void movieEvent(Movie mov) {
  mov.read();  //reads the frame
}



void draw() {  
    image(mov, 0, 0);  //draws the video
   
    manipPix();  //manipulates pixels
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

        if (bPixels.size() <70){  //make sure array list doesn't get too large. currently random but will change
         for (int j=1; j<bPixels.size(); j++) {  //cycle through  array list
             drawParticles(1000,mask);  //draws the mask
            
         
        }
        }
        else{
          bPixels.clear();  //clear arraylist when it gets too big
        }
      }
      }
  }
}
