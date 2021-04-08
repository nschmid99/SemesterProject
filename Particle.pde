
class Particle {
  PVector vel;
  PVector position;
  float size;
  float max;
  float ns;
  float count;
  float speed=1.5;
  
  Particle() {
    this.init();
    ns=700;
    this.max=80;

  }
  void init() {
    this.position=new PVector(random(width), random(height));
    this.count=0;
  }

  void display() {
    noStroke();
    color c = dance.get((int)(dance.width/ 2 + this.position.x - width/2), (int)(dance.height /2 + this.position.y - height/2));
    fill(c);
    contains();
    ellipse(this.position.x, this.position.y, 2, 5);
  }

  void update() {
    contains();
    float ang=noise(position.x/ns, position.y/ns) *random(0,PI) * ns;
    PVector vel=new PVector(cos(ang), sin(ang));
    vel.mult(speed);  //make it go a little faster
    position.add(vel);
    
    this.count++;
    if (this.count>this.max) 
    this.init();
  }
 
 
 
  void contains() {  //have to check for if the point is in the text

    if (points != null) {  //if points exist
     
     //temp point at position of text  
    
      RPoint temp = new RPoint(this.position.x-width/2, this.position.y-height/2); 
      for (int q=0; q<letter.countChildren(); q++) {  //count children insisde text
        //println();
        if (letter.children[q].contains(temp)) {
          fill(255);
        }}
      }
      
  
}}
