class sBoard{
 int cellSize=7;
 int size; //pixels 
 int x;
 int y;
 float inset=40; 
 PImage background;
 sTile SelectedTile; //coords
 sTile[] ActivatedTile; 
 //sTile SelTile;
 
 sTile[][] tiles = new sTile[7][7];
 
 boolean[][] tpl = new boolean[][]{
 { false, false, true, true, true, false, false}, 
 { false, true,  true, true, true, true,  false},
 { true,  true,  true, true, true, true,  true },
 { true,  true,  true, true, true, true,  true },
 { true,  true,  true, true, true, true,  true },
 { false, true,  true, true, true, true,  false},
 { false, false, true, true, true, false, false} 
   
 };

 sBoard(int ux, int uy){
   x=ux;
   y=uy;
   //size=us;
   //populate tiles
   for (int iy=0; iy<cellSize;iy++){
     for (int ix=0; ix<cellSize; ix++){
        if (tpl[ix][iy]) 
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
   translate(this.x,this.y); 
   //
   noFill();
   stroke(80);
   rect(0,0,9*tileSize,9*tileSize);
   for (int y=0; y<cellSize; y++){
     for (int x=0; x<cellSize; x++){
       tiles[x][y].draw();
     }
   
   }
   fill(255);
   textSize(12);
   text("Marbles: " + countMarbles() , tileSize/3, tileSize/3);
   //
   popMatrix();
   popStyle();
}

public int countMarbles(){
  int rs=0;
   for (int y=0; y<cellSize; y++){
     for (int x=0; x<cellSize; x++){
       if(!tiles[x][y].isEmpty()){
       rs++;
       //}else{}
     }   
   }
  }
  return rs;
}

public void deselectAll(){
     for (int y=0; y<cellSize; y++){
     for (int x=0; x<cellSize; x++){
       if(!tiles[x][y].isEmpty()){
           tiles[x][y].Selected = false;
       //}else{}
     }   
   }
  }
}

public void deactivateAll(){
    ActivatedTile = new sTile[0];
     for (int y=0; y<cellSize; y++){
     for (int x=0; x<cellSize; x++){
       if(tiles[x][y].isEmpty()){
           tiles[x][y].Activated= false;
       //}else{}
     }   
   }
  }
}

public void Activate(sTile[] tls){
  for (int i=0 ; i<tls.length ; i++){
    tls[i].Activated=true;
  }
 }
 
 public void Select(int x, int y){
 //SelectedTile = new int[]{x,y};
 }
 
 public void doMove(sTile dest){
   print("board do move");
 SelectedTile.pawn.doMove(dest);
 deactivateAll();
 }
 
 public void mouseMoved(){
   //println("moved");
     for (int y=0; y<cellSize; y++){
       for (int x=0; x<cellSize; x++){      
        tiles[x][y].MoveMouse(mouseX-this.x, mouseY-this.y  );       
       }   
     } 
 }
 
  public void mousePressed(){
   //println("moved");
   deselectAll();
     for (int y=0; y<cellSize; y++){
       for (int x=0; x<cellSize; x++){      
        tiles[x][y].PressMouse(mouseX-this.x, mouseY-this.y  );       
       }   
     } 
    //deactivateAll();

 }
 
}