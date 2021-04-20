
//Natasha Schmid CRCP 4391
//Semester Final Project
//taking dance imagery and manipulating pixels so that they create letterforms
//in particle class the exists and init functions are drawn from an example in the geomerative library by Richard Marxer

//how do I import in video to this?
int max = 1400; // the maximum number of active particles
ArrayList <Particle> particles = new ArrayList <Particle> (); // the list of particles
float globalRotation;
PImage text;
//PImage dance;
int state;
int frms = 41;
PImage ref; 
PImage[] dance = new PImage[frms];

void setup() {
  size(1500, 938);
  smooth(); 
  //dance = loadImage("collage2.jpg"); 
  text=loadImage("text.png");
  
  for (int i = 0; i < frms; ++i) {
    dance[i] = loadImage("ezgif-frame-" + i + ".jpg");
  }
  ref = dance[0];
}

void draw() {

  kill();// gets rid of particles with no life
  while (particles.size () < max) {
    particles.add(new Particle());  //keeps adding more particles 
  }
  if (frameCount % 80 == 0) {
    int count = (frameCount/80 % frms);
    ref = dance[count];}

  for (Particle p : particles) {
    p.display();  //displays particles

    switch(state) {
    case 0:
      p.update(); //this update has no life so the particles just draw and then delete
      break;
    case 1:
      p.update2();  //this update does have life so the particles flow into perlin noise
      break;
    }
  }
}

void keyPressed() {
  if (key=='g') {
    state=0;  //state with no life
  } else if (key=='h') {
    state=1;  //state with life
  }
}

void kill() {
  for (int i=particles.size()-1; i>=0; i--) {  //start from end and cycle through to delete
    Particle p = particles.get(i);
    if (p.life <= 0) {
      particles.remove(i);
    }
  }
}
