
class Particle {
  PVector vel, position;
  float noiseScale=300;
  float life;
  float rate;

  
  Particle(PVector replaced){
  this.position=replaced;
 // getPosition();
  this.vel= new PVector(0,0);
  life = random(0.5,1.5);
  rate=random(0.01,0.02);
  }
  
  void display(float r){
  
  
    point(position.x,position.y);
   
   //ellipse(position.x, position.y,r,r);
  }
  
  //MSAfluid pixelflow
  
  void update() {
    float direction = noise((position.x)/noiseScale, position.y/noiseScale)*TWO_PI; //use noise to randomize but control pixels
    PVector vel = PVector.fromAngle(direction + rotation);  //rotation is random and pulled from main class
 
    position.add(vel);  //add position and veloccity vectors together
    life -= rate; 
}

//not being used anymore since getting position from pixels
//void getPosition(){
//while(position==null) position = new PVector(random(width),random(height));
//}
}
