
class Particle {
  PVector position;
  float inc;
  float life;
  float opacity;
  float speed=200;

  Particle() {
    init();
    life = random(0.75, 1);
    opacity=30;
  }

  void update() {
    life=0;
    noStroke();
    // stroke(0);
  }

  void update2() {
    float rot=random(-TWO_PI,TWO_PI); //randomly choses rotation so that particles all go in different directions 
    float ang=noise(this.position.x*0.003, this.position.y*0.006, inc) *rot;  //noise function
    inc=inc+0.001;
    noStroke();
    PVector vel = new PVector(cos(ang), sin(ang));
    position.add(vel);
    vel.mult(speed);  //mult to make faster
    
    life=life-0.001;  //slowly kill off particles
    rot=random(-TWO_PI,TWO_PI);  
  }
//parametric equationn for circle see if spiral noise

  void display() {
    //get color from pimage
    color c = ref.get((int)(ref.width/ 2 + this.position.x - width/2), (int)(ref.height /2 + this.position.y - height/2));
    if (state==0) {
      fill(c, opacity);  //lower opacity for cloud effect
    }
    if (state==1) {
      fill(c, opacity=opacity+0.5); //increase opacity
    }
    if (state==2) {
      fill(c, opacity=opacity+0.5); //increase opacity
    }
    ellipse(position.x, position.y, 2, 3);  //oval shape
  }


  void init() {  //picks random position in text
  
  if(state==0 || state==1){
    while (position == null || !exists (position)) position = new PVector(random(-20,width), random(-20,height));
  }
  else if(state==2){  //just get position from anywhere on screen
  position = new PVector(random(-20,width), random(-20,height));
  noStroke();
  }

  }


  boolean exists(PVector v) {  //if black because using png for letters. all letters are black
    return text.get(int(v.x), int(v.y)) ==color(0);
  }
}
