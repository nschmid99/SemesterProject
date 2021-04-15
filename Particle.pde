
class Particle {
  PVector vel;
  PVector position;
  float size;
  float max;
  float ns;
  float count;
  float inc;
  int r;
  int s;
  
  int total=300;
//int []savex=new int[total];
  ArrayList <Integer> savetemp=new ArrayList <Integer>();
   ArrayList <Integer> savetempy=new ArrayList <Integer>();
  float speed=1.5;
  
  Particle() {
    this.init();
    ns=700;
    this.max=40;

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
  //  contrains();
    //cc();
    if(keyPressed){
this.position.x=lerp(this.position.x, r,0.1);
this.position.y=lerp(this.position.y, s,0.1);}
   inc=inc+0.001;
    float ang=noise(position.x*0.003, position.y*0.006,inc) *TWO_PI;
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
    
      RPoint temp = new RPoint(this.position.x-width/10, this.position.y-height/2); 
      for (int q=0; q<letter.countChildren(); q++) {  //count children insisde text
     
        if (letter.children[q].contains(temp)) {
          //println("inside");
          fill(255,255,255);
//          PVector t=new PVector(temp.x-width/2,temp.y-height/2);
//          float tx=temp.x;
//          float ty=temp.y;
//          if(tx!=0)
//          savetemp.add(new Integer((int)tx));
//            savetempy.add(new Integer((int)ty));
//          //int randx=(int) random(savetemp.size()+1);
//r=savetemp.get((int)random(0,savetemp.size()));
//s=savetempy.get((int)random(0,savetempy.size()));
////println(r);

}
//          //rintln(this.position.x);
        }}
      }
      
  
}

  void contrains() { 
    //if(savetemp.size()>3){
     //}
 // letter.getPointsInPaths();
  //println(  letter.getPointsInPaths().length);
  
  } //have to check for if the point is in the text

//    if (points != null) {  //if points exist
     
     
//         for(int x=0; x<width; x=x+30) {
//          for(int y=0; y<height; y=y+30){
//           if( letter.contains(new RPoint(x,y))){
//           savetemp=new PVector(x,y);
//           save.add(savetemp);
//           }
        
//      }
      
  
//}

    


  


//}
