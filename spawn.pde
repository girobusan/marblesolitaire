class sPawn{
  
  boolean Over=false;
  int posX;
  int posY;
  sBoard board;//????!??!!
  sTile hometile;
  sPawn(){
  
  }
  
  sPawn(int x, int y , sBoard brd , sTile hm){
  this.posX = x;
  this.posY = y;
  this.board = brd;
  this.hometile = hm;
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
  

  
  boolean checkMove(int incx, int incy){ //
  int sx = Sgn(incx); //Sgn(n) defined in main file
  int sy = Sgn(incy); 
  
  if ( (posX + 2*sx)>6 || (posX + 2*sx)<0){
    return false;
  } 
  if ( (posY+2*sy)>6 || (posY+2*sy)<0 ){
    return false;
  }  
     
  if (!board.tiles[posX+sx][posY+sy].isAvailable()){    
      if (board.tiles[posX + 2*sx ][posY + 2*sy].isAvailable()){
        return true;
      }
    }
    //
    return false;
  }
  
  public sTile[] possibleMoves (){
    sTile[] preres = new sTile[4];
    int counter=0;
    //check right
    if (checkMove(1,0))
    { 
      preres[counter] = board.tiles[posX+2][posY];
      counter++;     
    }
     //check left
     if (checkMove(-1,0))
     {
       preres[counter] = board.tiles[posX-2][posY];
       counter++;
     
     }
     //check top
     if (checkMove(0,-1))
     {
       preres[counter] = board.tiles[posX][posY-2];
       counter++;   
     }
     //check bottom
     if (checkMove(0,1))
     {
       preres[counter] = board.tiles[posX][posY+2];
       counter++;
     }
     //end checks
     sTile[] finres = new sTile[counter];
     for (int i=0 ; i<counter ; i++){
     finres[i] = preres[i];
     }  
  //println("Number of possible moves " + finres.length);
  return finres;
  }
  
  public void doMove(sTile dest){

    //let me kill
    int kx = (dest.posX+hometile.posX)/2;    
    int ky = (dest.posY+hometile.posY)/2;    
    //println("To kill " + kx + ":" + ky);    
    board.tiles[kx][ky].Clear();
    //
    this.hometile.Clear();
    dest.setPawn(this);  
  }

}//end class

class dPawn extends sPawn{
  /*
  boolean Over=false;
  int posX;
  int posY;
  sBoard board;//????!??!!
  sTile hometile;
 */
  
  dPawn(){
  super();
  }
  
  dPawn(int x, int y , sBoard brd , sTile hm){
   super(x,y,brd,hm);
  }
  
  public void draw(){
    pushStyle();
    ellipseMode(CENTER);
    if (Over){
    stroke(#FFFFFF);
    }else{
    noStroke();
    }
    fill(#EA1818);
    ellipse(tileSize/2, tileSize/2, tileSize/1.8, tileSize/1.8);
    fill(#FFFFFF);
    ellipse(tileSize/2.5, tileSize/2.5, tileSize/8, tileSize/8);
    popStyle();
  
  }
  

  
  boolean checkMove(int incx, int incy){ //
  return super.checkMove(incx, incy);
  }
  
  public sTile[] possibleMoves (){
    sTile[] preres = new sTile[4];
    int counter=0;
    //check top right
    if (checkMove(1,-1))
    { 
      preres[counter] = board.tiles[posX+2][posY-2];
      counter++;     
    }
     //check top left
     if (checkMove(-1,-1))
     {
       preres[counter] = board.tiles[posX-2][posY-2];
       counter++;
     
     }
     //check bottom left
     if (checkMove(-1,1))
     {
       preres[counter] = board.tiles[posX-2][posY+2];
       counter++;   
     }
     //check bottom right
     if (checkMove(1,1))
     {
       preres[counter] = board.tiles[posX+2][posY+2];
       counter++;
     }
     //end checks
     sTile[] finres = new sTile[counter];
     for (int i=0 ; i<counter ; i++){
     finres[i] = preres[i];
     }  
  //println("Number of possible moves " + finres.length);
  return finres;
  }
  
  public void doMove(sTile dest){
  super.doMove(dest);
  }

}//end class