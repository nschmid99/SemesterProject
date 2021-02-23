//IGNORE THIS FOR NOW! working on making the points into a flow field like perlin noise
class Particle {
  PVector vel, position;
  float r;
  float g;
  float b;
  color c;
  PImage mask;
  float alpha;
  
Particle(){
//mask = loadImage("mask.jpeg");
}
  Particle(float x, float y) {
    this.vel=new PVector(0, 0);
    this.position = new PVector(x, y);
    fill(255,0,0);
    
   // getColor( rr, gg, bb);
  
  }

  void render(float rad) {
     // fill(c);
    ellipse(this.position.x, this.position.y, rad, rad);
  }

  final float noiseScale = 200;

  void update() {
    float direction = noise((this.position.x)/noiseScale, this.position.y/noiseScale)*TWO_PI;
    this.vel.x=sin(direction)*0.95;
    this.vel.y = cos(direction)*0.5;
    this.position.add(this.vel);
  }

  void getColor(float rR, float gG, float bB) {
    r=rR;
    g=gG;
    b=bB;
    c=color(r, g, b);
  }
  
  
}
