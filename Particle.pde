
class Particle {
  float x;
  float y;
  PVector vel;
  PVector position;
  float size;
  float leng;
  float sp;
  float max;
  float ns;
  float count;

  Particle() {
    //this.position=pos;
    this.init();
    ns=800;
    this.sp=300/ns;
    float leng=random(10, 30);
    this.max=leng/this.sp;

  }
  void init() {
    this.position=new PVector(random(width), random(height));
    this.count=0;
  }

  void display() {
    noStroke();
    color c = dance2.get((int)(dance2.width/ 2 + this.position.x - width/2), (int)(dance2.height /2 + this.position.y - height/2));
    fill(c);
    contains();
    ellipse(this.position.x, this.position.y, 2, 5);
  }

  void update() {

    contains();
    float ang=noise(position.x/ns, position.y/ns) *TWO_PI * ns;
    PVector vel=new PVector(cos(ang), sin(ang));
    position.add(vel);
    this.count++;
    if (this.count>this.max) this.init();
  }

  void contains() {  //have to check for if the point is in the text

    if (points != null) {  //if points exist
      //temp point at position of text 
      RPoint temp = new RPoint(this.position.x-width/2, this.position.y-3*height/4);
      for (int q=0; q<grp.countChildren(); q++) {  //count children insisde text
        //println();
        if (grp.children[q].contains(temp)) {
          fill(255);
        }
      }
    }
  }
  
  void directflow(){
  //direct particles to flow from one screen to the next
  
  }
}
