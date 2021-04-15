
class Particle {
  PVector position;
  float inc;
  float life;
  float opacity;
  float speed=1.5;

  Particle() {
    init();
    life = random(0.75, 1.25);
    opacity=30;
  }

  void update() {
    life=0;
    noStroke();
    // stroke(0);
  }

  void update2() {
    float rot=random(-TWO_PI, TWO_PI);  
    float ang=noise(this.position.x*0.003, this.position.y*0.006, inc) *rot;  //noise function
    inc=inc+0.001;
    noStroke();
    PVector vel = new PVector(cos(ang), sin(ang));
    position.add(vel);
    vel.mult(speed);  //mult to make faster
  }


  void display() {
    //get color from pimage
    color c = dance.get((int)(dance.width/ 2 + this.position.x - width/2), (int)(dance.height /2 + this.position.y - height/2));
    if (state==0) {
      fill(c, opacity);  //lower opacity for cloud effect
    }
    if (state==1) {
      fill(c, opacity=opacity+0.5); //increase opacity
    }
    ellipse(position.x, position.y, 2, 3);  //oval shape
  }


  void init() {  //picks random position in text
    while (position == null || !exists (position)) position = new PVector(random(width), random(height));
  }


  boolean exists(PVector v) {  //if black because using png for letters. all letters are black
    return text.get(int(v.x), int(v.y)) ==color(0);
  }
}
