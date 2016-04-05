class sBoard{
 int cellSize=7;
 int size; //pixels 
 int x;
 int y;
 float inset=0.2; 
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

 sBoard(int ux, int uy, int us){
   x=ux;
   y=uy;
   size=us;
   //populate tiles
   for (int iy=0; iy<cellSize;iy++){
     for (int ix=0; ix<cellSize; ix++){
        if (tpl[ix][iy]==1) 
         {
         tiles[ix][iy] = new sTile();
         }else
         {
         tiles[ix][iy] = new noTile();
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
   background(33);
   //translate coords to board's zero point
   //draw background
   //loop: translate coords to each tile's zero
   //call sTile.draw()
 }
 
}