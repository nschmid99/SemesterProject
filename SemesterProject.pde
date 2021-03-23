import spout.*;

//Natasha Schmid CRCP 4391
//Semester Project
//camera setup from processing tutorial
//https://processing.org/tutorials/video/


import geomerative.*;
//import processing.video.*;    //processing video library

Spout spout;

int resX=16;
int resY=4;

PImage data;


//int resx=
int row;
int pixel_index;
PImage dance;
PVector position;  //not used
PVector vel;  //not used
ArrayList <Particle> particles= new ArrayList <Particle>();

float rotation;
RFont f;
RShape grp;
//RShape grmo; not being used
RPoint[] points;

int alpha;
boolean ignoringStyles = false;


void setup() {
  size(600, 459);  //size of video clip
  //for spout
  size(16,4,P2D);
  spout=new Spout(this);
  
  spout.createSender("SpoutProces");
  dance = loadImage("dance.PNG");  //creates a mask from the image
  stroke(0);

  RG.init(this);

  RG.ignoreStyles(ignoringStyles);
  grp = RG.getText("H", "Catalina Rayden.ttf", 300, CENTER);

  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizerStep(2); //allows for more

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(10); //makes loger
  points = grp.getPoints();  //gets points
  rotation=random(TWO_PI);
  // Enable smoothing
  smooth();
  image(dance, 0, 0);
  dance.loadPixels();
}


void draw() {  

//init  spout texture
data=createImage(resX,resY,ARGB);
data.loadPixels();
//need to create image only from certain parts of the actual image.


//then send to touchdesigner
spout.sendTexture(dance);
  pushMatrix();
  translate(width/2, 3*height/4); //translating to screen
  noFill();
  //draw text
  grp.draw();
  popMatrix();



  for (int i=0; i<dance.width; i=i+8) {  //cycle through image pixels, i++ is too slow
    for (int j=0; j<dance.height; j=j+8) {

      int loc = i+j*width; //get the position of a pixel
      int x=loc % dance.width;  //get xpos
      int y=loc / dance.width;  //get y pos
      color c=get(x, y);  //get color of pixel
      position=new PVector(x, y);  //PVector to be used for particles


      if (points != null) {  //if points exist
        RPoint temp = new RPoint(x-width/2, y-3*height/4); //temp point at position of text 

        for (int q=0; q<grp.countChildren(); q++) {  //count children insisde text
          if (grp.children[q].contains(temp)) {  //if position is inside text
            //println("inside"); just to check if it works
            RG.ignoreStyles(true);  //ignore geomerative and use processing methods

            alpha=255;  //adjusts opacity
            stroke(c, alpha);  //sets particle color
            addRemoveParticles();  

            for (Particle p : particles) {
              p.update();  
              p.display(1);
            }

            alpha=alpha-20;  //decrease opacity

            grp.children[q].draw();  //draw children
            RG.ignoreStyles(ignoringStyles);  //set bsck to geomerative
          } else {   
            //something here for boudary checking
          }
        }
      }
    }
  }

  updatePixels();
  dance.updatePixels();
  //data will  draw
}

void boundarycheck() {
  //code here for boundary checking
}

void exit(){
super.exit();
}

void stop(){
super.stop();
}


void addRemoveParticles() {
  // remove particles with no life left
  int checkr=particles.size()-1;
  for (int i=checkr; i>=0; i--) {
    Particle p = particles.get(i);
    if (p.life <= 0.5) {
      particles.remove(i);
    }
  }
  // add particles until the maximum
  while (particles.size () < 400) {  //400 needs to become a variable
    particles.add(new Particle(position));
  }
}
