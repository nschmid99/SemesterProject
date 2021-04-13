RShape letter;
int posit=350;
RPoint[] points;
boolean ignoringStyles = false;


class Letters {

  Letters(String l) { 

    //uses processing function not geomerative
    RG.ignoreStyles(ignoringStyles);

    //setup of all letters into objects, needs to  be reduced
    letter = RG.getText(l, "Catalina Rayden.ttf", posShape, CENTER);
    
    RG.setPolygonizer(RG.ADAPTATIVE);
    RG.setPolygonizer(RG.UNIFORMSTEP);
    RG.setPolygonizerStep(2); //allows for more length

    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength(10); //makes longer
    points = letter.getPoints();
  //  rect(topLeft.x, topLeft.y, bottomRight.x - topLeft.x, bottomRight.y - topLeft.y);
  }


  void display(int x, int y) {
    RG.shape(letter, x, y, posit, posit);
  }
}
