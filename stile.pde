class sTile{
  sBoard board;
  //positions in the grid
  protected sPawn pawn;
  protected boolean Empty=true;
  int posX; 
  int posY;
  //coordinates
  int x;
  int y;
  int size;
  boolean Over = false;

  sTile(){
    this.posX=0;
    this.posY =0;
    this.size = tileSize;
  }
  //x, y , size -- geometical position and size, px and py - position (logical) in the board
  sTile(int x, int y, int size, int px , int py, sBoard brd){
    this.x=x;
    this.y =y;
    this.posX = px;
    this.posY = py;
    this.board=brd;
    this.size = size;
  }

  public void draw(){
    pushMatrix();
    pushStyle();
    translate(x,y);
    //
    ellipseMode(CENTER);
    noStroke();
    fill(80);
    ellipse( size/2, size/2 , size/4, size/4);
    textAlign(CENTER);
    if (!Over){
      fill(70);
    }else{
      fill(#E8F01D);
    }
    textSize(10);
    text(posX+":"+posY, size/2, size-5);
    fill(255);
    
    if (!Empty){
    pawn.draw();
    }
    //
    popStyle();
    popMatrix();
  }

  public boolean isInside(int tx,int ty){
    if ( ((x+tileSize)>tx) && (tx>x) &&(ty>y) && ((y+tileSize)>ty )   ){
    return true;
    }else{
    return false;
    }
  }
  
  public void setPawn(sPawn pawn){
  this.pawn=pawn;
  Empty=false;  
  }
  
  public sPawn getPawn(){
   if (!Empty){
    return this.pawn;
   }else{
   return null;
   } 
  }
  
  public void Clear(){
  Empty=true;
  }
  
 

  public void MoveMouse(int ix, int iy){  
      if (isInside(ix, iy)){
      Over=true;
      
      if (!Empty){pawn.Over=true;}
      //println("over " + this.x + ":" + this.y + " (" + ix + ":" + iy + ")");
      }else{
      Over=false;
      if (!Empty){pawn.Over=false;}
      }
    }
}




class noTile extends sTile{

  noTile(int x, int y, int size, int px , int py , sBoard brd){
    this.x=x;
    this.y =y;
    this.size = size;
  }
  
   noTile(){
   super();
   }
  
  public void draw(){
  //do nothing 
  }
  public boolean isInside(int tx,int ty){
   return false;
  }
  
  public void MoveMouse(int ix, int iy){
  //do nothing
  }

}