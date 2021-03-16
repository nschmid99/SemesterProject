
class Particle {
  PVector vel, position;
  float noiseScale=150;
  float life;
  float rate;
  
  Particle(PVector replaced){
  this.position=replaced;
  this.vel= new PVector(0,0);
  life = random(0.5,1.5);
  rate=random(0.01,0.02);
  }
  
  void display(float r){
  
   //boolean special = random(1) < 0.001;
    strokeWeight(0.04);
    //stroke(255, special ? random(175, 255) : 65);
   // stroke(0,0,0,30);
    noStroke();
    ellipse(position.x, position.y,r,r);
  }
  
  
  
  void update() {
    float direction = noise((position.x)/noiseScale, position.y/noiseScale)*TWO_PI;
    PVector vel = PVector.fromAngle(direction + globalRotation);
    vel.mult(0.5);
    
    position.add(vel);
    life -= life;
  
  
}}
