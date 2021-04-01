
//Natasha Schmid CRCP 4391
//Semester Final Project
//taking dance imagery and manipulating pixels so that they create letterforms
//camera setup from processing tutorial
//https://processing.org/tutorials/video/


import geomerative.*;
//import processing.video.*;    //processing video library

//Movie mov;
PImage dance;


Particle [] par=new Particle[1400];
float rotation;
RFont f;
RShape grp;
RShape grpo;
RShape grpu;
RShape grpn;
RShape grpd;
RShape grpl;
RShape grpe;
RShape grps;
RShape grpss;
int posShape=350;
int maxPar=1400;
//RShape grmo; not being used
RPoint[] points;
float[] tempP;
int alpha;
boolean ignoringStyles = false;


void setup() {

  fullScreen();
  dance = loadImage("collage.jpg");  //creates image
  stroke(0);

  //setup particles
  for (int m=0; m<maxPar; m++) {
    par[m]=new Particle();
  }

  //init geomerative objects
  RG.init(this);

  //uses processing function not geomerative
  RG.ignoreStyles(ignoringStyles);

  //setup of all letters into objects, needs to  be reduced
  grp = RG.getText("B", "Catalina Rayden.ttf", posShape, CENTER);
  grpo = RG.getText("O", "Catalina Rayden.ttf", posShape, CENTER);
  grpu = RG.getText("U", "Catalina Rayden.ttf", posShape, CENTER);
  grpn = RG.getText("N", "Catalina Rayden.ttf", posShape, CENTER);
  grpd = RG.getText("D", "Catalina Rayden.ttf", posShape, CENTER);
  grpl = RG.getText("L", "Catalina Rayden.ttf", posShape, CENTER);
  grpe = RG.getText("E", "Catalina Rayden.ttf", posShape, CENTER);
  grps = RG.getText("S", "Catalina Rayden.ttf", posShape, CENTER);
  grpss = RG.getText("S", "Catalina Rayden.ttf", posShape, CENTER);
  RG.shape(grp, width/10, height/2, posShape, posShape);
  RG.shape(grpo, width*3/10, height/2, posShape, posShape);
  RG.shape(grpu, width*5/10, height/2, posShape, posShape);
  RG.shape(grpn, width*7/10, height/2, posShape, posShape);
  RG.shape(grpd, width*9/10, height/2, posShape, posShape);
  RG.shape(grpl, width*2/10, height*3/4, posShape, posShape);
  RG.shape(grpe, width*4/10, height*3/4, posShape, posShape);
  RG.shape(grps, width*6/10, height*3/4, posShape, posShape);
  RG.shape(grps, width*8/10, height*3/4, posShape, posShape);


  RG.setPolygonizer(RG.ADAPTATIVE);
  RG.setPolygonizer(RG.UNIFORMSTEP);
  RG.setPolygonizerStep(2); //allows for more lenngth

  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(10); //makes loger
  points = grp.getPoints();  //gets points

  // Enable smoothing
  smooth();

  //clear background
  background(255);
}


void draw() {  

  //draw and update particles
  for (int m=0; m<maxPar; m++) { 
    par[m].update();
    par[m].display();
  }
}
