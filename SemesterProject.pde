
//Natasha Schmid CRCP 4391
//Semester Final Project
//taking dance imagery and manipulating pixels so that they create letterforms

import geomerative.*;

PImage dance;
Letters b;

Particle [] par=new Particle[1400];
float rotation;
int posShape=350;
int maxPar=1400;



void setup() {

  fullScreen();
// size(1200,1200);
  dance = loadImage("collage2.jpg");  //creates image
  stroke(0);

  //setup particles
  for (int m=0; m<maxPar; m++) {
    par[m]=new Particle();
  }

  //init geomerative objects
  RG.init(this);
  b=new Letters("boundless");
  

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
