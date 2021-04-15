

//Natasha Schmid CRCP 4391
//Semester Final Project
//taking dance imagery and manipulating pixels so that they create letterforms
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;
import geomerative.*;

PImage dance;
Letters b;
BodyDef bd = new BodyDef();

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
  b=new Letters("b");
  b.display(200,200);

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
