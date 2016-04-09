class sTile{
  sBoard board;

  protected sPawn pawn;
  protected boolean Empty=true;     //is there a marble?
  protected boolean Available=true; //can other marble move here?
  boolean Selected = false; //is the marble here selected by user?
  boolean Activated = false; //is this tile a possible move target for selected marble?
  //positions in the grid
  int posX; 
  int posY;
  //'physical' coordinates relative to parent (board)
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
    if (Activated){
       fill(200);
    }else{
       fill(80);
    }
    ellipse( size/2, size/2 , size/4, size/4);
    textAlign(CENTER);
    //if (!Over){
    //  fill(70);
    //}else{
    //  fill(#E8F01D);
    //}
    //textSize(10);
    //text(posX+":"+posY, size/2, size-5);
    fill(255);
    if (Selected){
     stroke(255);
     noFill();
    ellipse( size/2, size/2 , 0.8*size, 0.8*size);
    }
    
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
  pawn.posX = this.posX;
  pawn.posY = this.posY;
  pawn.board = this.board;
  pawn.hometile = this;
  Empty=false; 
  Available=false;
  }
  
  public sPawn getPawn(){
   if (!Empty){
    return this.pawn;
   }else{
   return null;
   } 
  }
  
  public boolean areYouFree(){
  if (Empty){
    return false;
  }else{
    return pawn.possibleMoves().length>0;
    }
  }
  
  public void Clear(){
  //println("Clearing " + this.posX + ":" +  this.posY);
  Empty=true;
  Available=true;
  Activated=false;
  }
  
  public boolean isEmpty(){
  return Empty;
  }
  
  public boolean isAvailable(){
  return Available;
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
  public void PressMouse(int ix, int iy){
  if (isInside(ix, iy)){
    if (!Empty){
       Selected=true;
       board.deactivateAll();
       board.Activate( pawn.possibleMoves() );
       //int[] r = new int[]{this.x , this.y};
       board.SelectedTile = this;
       //board.SelectedTile = new int[]{this.x , this.y};//; //new int[] {this.x, this.y};
    }
    if(Empty && Activated){
     board.doMove(this); 
    //board.deactivateAll();//
    }  
   }  
  }//Press 
   
}




class noTile extends sTile{
  
  protected boolean Empty=true;
  protected boolean Available=false;

  noTile(int x, int y, int size, int px , int py , sBoard brd){
    super(x,y,size,px,py,brd);
  }
  
  noTile(){
  super();
  }
   
  public void setPawn(sPawn pawn){
    //do nothing;
  }
    
  public void Clear(){
  //do nothing
  }
  
  public void draw(){
  //do nothing 
  }
  public boolean isInside(int tx,int ty){
   return false;
  }
  
  public boolean isEmpty(){
    return true;
  }
  
  public boolean isAvailable(){
    return false;
  }
  
  public void MoveMouse(int ix, int iy){
  //do nothing
  }
  
  public void PressMouse(int ix, int iy){
  //do nothing
  }

}