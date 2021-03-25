
//Natasha Schmid CRCP 4391
//Semester Project
//camera setup from processing tutorial
//https://processing.org/tutorials/video/


import geomerative.*;
//import processing.video.*;    //processing video library


PImage dance;
PVector position;  //not used
PVector vel;  //not used
//ArrayList <Particle> particles= new ArrayList <Particle>();
Particle [] par=new Particle[500];
float rotation;
RFont f;
RShape grp;
//RShape grmo; not being used
RPoint[] points;
float[] tempP;
int alpha;
boolean ignoringStyles = false;


void setup() {
  size(486, 398);  //size of video clip

  dance = loadImage("dance.PNG");  //creates a mask from the image
  stroke(0);
  for (int m=0; m<500; m++) {
    par[m]=new Particle();
  }
  RG.init(this);

  RG.ignoreStyles(ignoringStyles);
  grp = RG.getText("H", "Catalina Rayden.ttf", 350, CENTER);

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
  background(255);
  //dance.loadPixels();
}


void draw() {  

  //not sure if i will draw the image or not
  pushMatrix();  
  translate(width/2, 3*height/4); //translating to screen because text starts at 0,0
  noFill();
  //draw text
  //grp.draw();  
  popMatrix();

  //rect(width/2,height/2,60,60);
  for (int m=0; m<500; m++) {  //500 needs to be replaced with a variable
    par[m].update();
    par[m].display();
  }
}
