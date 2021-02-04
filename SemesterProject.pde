import processing.video.*;
Capture cam;
//Natasha Schmid CRCP 4391
//Semester Project
//camera setup from processing tutorial
//https://processing.org/tutorials/video/
void setup(){
  size(400,500);  //setup screen
  cam=new Capture(this, displayWidth, displayHeight,30); //currently just linked to webcam
  cam.start();  //start camera
}
void captureEvent(Capture cam) {
 cam.read(); //reading from camera
}

void draw(){
  image(cam,0,0);  //displaying cameta
  
  //manipulate video
  //make letter forms
  //if pixel isnt white, manipulate to form letter
  //typeface: helvetica
  //how can i make letterforms
  //need to be able to get equation of letterforms
  
 
}
