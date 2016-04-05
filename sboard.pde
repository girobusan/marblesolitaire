class sBoard{
 int cellSize=7;
 int size; //pixels 
 int x;
 int y;
 float inset=40; 
 PImage background;
 
 sTile[][] tiles = new sTile[7][7];
 
 int[][] tpl = new int[][]{
 { 0, 0, 1, 1, 1, 0, 0}, 
 { 0, 1, 1, 1, 1, 1, 0},
 { 1, 1, 1, 1, 1, 1, 1},
 { 1, 1, 1, 1, 1, 1, 1},
 { 1, 1, 1, 1, 1, 1, 1},
 { 0, 1, 1, 1, 1, 1, 0},
 { 0, 0, 1, 1, 1, 0, 0}
   
 };

 sBoard(int ux, int uy){
   x=ux;
   y=uy;
   //size=us;
   //populate tiles
   for (int iy=0; iy<cellSize;iy++){
     for (int ix=0; ix<cellSize; ix++){
        if (tpl[ix][iy]==1) 
         {
         tiles[ix][iy] = new sTile((ix+1)*tileSize, (iy+1)*tileSize, tileSize, ix, iy, this);
         }else
         {
         tiles[ix][iy] = new noTile((ix+1)*tileSize, (iy+1)*tileSize, tileSize, ix , iy, this);
         }
      }
    }//populated
 } 
  public void setTile( sTile t, int ix , int iy){
    t.board=this;
    t.posX = x;
    t.posY = y;
    tiles[ix][iy]=t;
  } 

   
 public void draw(){
   pushStyle();
   pushMatrix();
   translate(x,y); 
   //
   noFill();
   stroke(80);
   rect(0,0,9*tileSize,9*tileSize);
   for (int y=0; y<cellSize; y++){
     for (int x=0; x<cellSize; x++){
       tiles[x][y].draw();
     }
   
   }
   //
   popMatrix();
   popStyle();
}
 
 public void mouseMoved(){
   //println("moved");
     for (int y=0; y<cellSize; y++){
       for (int x=0; x<cellSize; x++){      
        tiles[x][y].MoveMouse(mouseX-this.x, mouseY-this.y  );       
       }   
     }
 
 }
 
}