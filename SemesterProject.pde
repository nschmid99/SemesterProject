//Natasha Schmid CRCP 4391
//Semester Project
//camera setup from processing tutorial
//https://processing.org/tutorials/video/
import geomerative.*;
import processing.video.*;    //processing video library
//Movie dance;  //create movie object
static final String movFile = "rdj.mov";  //video file located in the data folder
ArrayList bPixels;  //arraylist to store pixels
PImage mask;  //letter file being used in mask
PImage dance;
PVector position;  //not used
PVector vel;  //not used
ArrayList <Particle> particles= new ArrayList <Particle>();
int x;
int y;
float globalRotation;
RFont f;
RShape grp;
RPoint[] points;

  boolean ignoringStyles = false;


void setup() {
  size(640, 360);  //size of video clip
  //dance = new Movie(this, movFile);  //instantiate movie
  //dance.play();  //play movie
  //bPixels=new ArrayList();  //create array list
  //frameRate(4);
  //dance.speed(0.25);
  dance = loadImage("dance.PNG");  //creates a mask from the image
 // vel=new PVector(0, 0); not yet used
 // position = new PVector(0,0); //not yet used
  //VERY IMPORTANT: Allways initialize the library in the setup
  stroke(0);
  RG.init(this);

    RG.ignoreStyles(ignoringStyles);
  //  Load the font file we want to use (the file must be in the data folder in the sketch floder), with the size 60 and the alignment CENTER
  grp = RG.getText("Hello!", "Catalina Rayden.ttf", 150, CENTER);
    RG.setPolygonizer(RG.ADAPTATIVE);
     RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizerStep(2); //allows for more
  
  RG.setPolygonizer(RG.UNIFORMLENGTH);
 // RG.setPolygonizerLength(map(3, 0, height, 3, 200));
  RG.setPolygonizerLength(10); //makes loger
  points = grp.getPoints();  //gets points

  // Enable smoothing
  smooth();
}


void draw() {  
    //draws the video 
    //manipPix();  //manipulates pixels
    
  
  //image(mov, 0, 0);
  //  mov.loadPixels();
  image(dance,0,0);
 dance.loadPixels();
    
    pushMatrix();
    translate(width/2, 3*height/4);
  
  //// Draw the group of shapes
  //noFill();
  stroke(0);
 noFill();
  grp.draw();
popMatrix();
  //// Get the points on the curve's shape
 
  
  //// If there are any points
 if(points != null){
  
  
    for(int i=0;i<dance.width;i=i+8){
    for(int j=0;j<dance.height;j=j+8){
      
    int loc = i+j*width; //get the position of a pixel
      int x=loc % dance.width;  //get xpos
      int y=loc / dance.width;
      color c=get(x,y);
    
      RPoint temp = new RPoint(x-width/2,y-3*height/4); //temp point at position of text
   
          for(int q=0;q<grp.countChildren();q++){
    if(grp.children[q].contains(temp)){  //if position is inside text
    //println("inside");
     RG.ignoreStyles(true);
     //grp.setFill(c);
     stroke(0);
    // noFill();
     
      fill(c);  //make the color of the image pixel
     // ellipse(x,y,7,7);
 
     position=new PVector(x,y);  // create particles

       addRemoveParticles();
  //}
    for (Particle p : particles) {
   p.update();
   p.display(1);}
      
     grp.children[q].draw();
       RG.ignoreStyles(ignoringStyles);
    }
    else{
       // println("outside");
      
      
      
    //  // grp.children[q].draw();
    //  // RG.ignoreStyles(ignoringStyles);
    }
  }


      }
      
    }
    }
     //updatePixels();
     //dance.updatePixels();
  }
 // }  
  
  // mov.updatePixels();
//}




//void movieEvent(Movie mov) {
//  mov.read();  //reads the frame
//}

void addRemoveParticles() {
  // remove particles with no life left
  for (int i=particles.size()-1; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
     // println("removed");
    }
  }
  // add particles until the maximum
  while (particles.size () < 200) {
    particles.add(new Particle(position));
    //p.update();
  }
}
