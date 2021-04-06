
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
    this.max=50;

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
    //map(this.position.x,0,width,0,width/3)
  }

  void update() {
    contains();
    float ang=noise(position.x/ns, position.y/ns) *random(0,TWO_PI) * ns;
    PVector vel=new PVector(cos(ang), sin(ang));
    vel.mult(speed);  //make it go a little faster
    position.add(vel);
    
    this.count++;
    if (this.count>this.max) 
    this.init();
  }
 
 
 //this function needs  to be greatly reduced, will be put into its own class of letters
  void contains() {  //have to check for if the point is in the text

    if (points != null) {  //if points exist
     
     //temp point at position of text  
    
      RPoint temp = new RPoint(this.position.x-width/10, this.position.y-height/2); 
      for (int q=0; q<letter.countChildren(); q++) {  //count children insisde text
        //println();
        if (letter.children[q].contains(temp)) {
          fill(255);
        }}
      }
      
    // temp = new RPoint(this.position.x-width*3/10, this.position.y-height/2);  
    //  for (int q=0; q<grpo.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grpo.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
      
    //  temp = new RPoint(this.position.x-width*5/10, this.position.y-height/2);  
    //  for (int q=0; q<grpu.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grpu.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
      
    //   temp = new RPoint(this.position.x-width*7/10, this.position.y-height/2);  
    //  for (int q=0; q<grpn.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grpn.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
      
    //   temp = new RPoint(this.position.x-width*9/10, this.position.y-height/2);  
    //  for (int q=0; q<grpd.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grpd.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
      
    //   temp = new RPoint(this.position.x-width*2/10, this.position.y-height*3/4);  
    //  for (int q=0; q<grpl.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grpl.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
      
    //  temp = new RPoint(this.position.x-width*4/10, this.position.y-height*3/4);  
    //  for (int q=0; q<grpe.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grpe.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
      
    //  temp = new RPoint(this.position.x-width*6/10, this.position.y-height*3/4);  
    //  for (int q=0; q<grps.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grps.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
      
    //  temp = new RPoint(this.position.x-width*8/10, this.position.y-height*3/4);  
    //  for (int q=0; q<grpss.countChildren(); q++) {  //count children insisde text
    //    //println();
    //    if (grpss.children[q].contains(temp)) {
    //      fill(255);
    //    }
    //  }
    //}
  }
  
  void directflow(){
  //direct particles to flow from one screen to the next
  
  }
}
