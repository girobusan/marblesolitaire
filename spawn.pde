class sPawn{
  
  boolean Over=false;

  sPawn(){
  
  }
  
  public void draw(){
    pushStyle();
    ellipseMode(CENTER);
    if (Over){
    stroke(#FFFFFF);
    }else{
    noStroke();
    }
    fill(#4873DE);
    ellipse(tileSize/2, tileSize/2, tileSize/1.8, tileSize/1.8);
    fill(#FFFFFF);
    ellipse(tileSize/2.5, tileSize/2.5, tileSize/8, tileSize/8);
    popStyle();
  
  }


}