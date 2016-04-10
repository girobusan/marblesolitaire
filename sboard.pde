class sBoard{
 int cellSize=7;
 int size; //pixels 
 int x;
 int y;
 float inset=40; 
 int idleCount = 0;
 PImage background;
 boolean isOn=true;
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
 
String[][] thePosition = new String[][]{
{ "_", "_","R", "R", "D", "_","_" },
{ "_", "R","R", "R", "D", "D","_" },
{ "R", "R","R", "R", "D", "D","D" },
{ "R", "R","_", "R", "D", "D","D" },
{ "R", "R","R", "D", "D", "D","D" },
{ "_", "R","R", "D", "D", "D","_" },
{ "_", "_","R", "D", "D", "_","_" }
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
  
  public void setPosition(String[][] boardMap){
  
     for (int y=0; y<7; y++){
       for (int x=0; x<7; x++){ 
            //println("Set " + boardMap[x][y] );
            if (boardMap[x][y] == "R"){ //"R" for REGULAR
            //println("regular");
            theBoard.tiles[x][y].setPawn(new sPawn()); 
            continue;
            }
            if (boardMap[x][y] == "D"){ //"D" for DIAGONAL
            theBoard.tiles[x][y].setPawn(new dPawn()); 
            continue;
            }
            //if (boardMap[x][y] == '_'){ //"_" for EMPTY
            theBoard.tiles[x][y].Clear(); 
            //}
       }   
      }
      isOn=true;
    }
 
 public void resetPosition(){
    deselectAll();
    deactivateAll();
    setPosition(thePosition); 
 }
 
 public void changePosition(String bm[][]){
 thePosition = bm;
 resetPosition();
 }

   
 public void draw(){
   if(isOn){
   idleCount++;
     if (idleCount>5){
       isThereAmove();
     idleCount=0;
     }
   }
   pushStyle();
   pushMatrix();
   translate(this.x,this.y); 
   fill(#444444);
   noStroke(); // stroke(80);
   rect(0,0,9*tileSize,9*tileSize); 
   //
   //noFill();
   
   //rect(0,0,9*tileSize,9*tileSize);
   for (int y=0; y<cellSize; y++){
     for (int x=0; x<cellSize; x++){
       tiles[x][y].draw();
     }
   
   }
   fill(255);
   //textSize(12);
   if(isOn){
     textFont(sansSmall);
     fill(#666666);
     text("Marbles: " + countMarbles() , tileSize/3, tileSize/3);
   }
   //if there is the end
   if (!isOn){
     fill(#333333, 150);
     noStroke();
     rect(tileSize*2, tileSize*3, tileSize*5, tileSize*2.5);
     textFont(sansBig);
     fill(255);
     textAlign(CENTER);
     text("No more moves," , tileSize*4.5, tileSize*4);
     text(countMarbles() + " marbles left." , tileSize*4.5, tileSize*4+30);
     textFont(sansSmall);
     text("(click to start over)." , tileSize*4.5, tileSize*4+50);


   }
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

public boolean isThereAmove(){//...or die
    for (int y=0; y<cellSize; y++){
     for (int x=0; x<cellSize; x++){
       if(tiles[x][y].areYouFree()){
       return true;
     }   
   }
  }
  isOn=false;
  //println("No more moves");
  return false;
}

public void Activate(sTile[] tls){
  for (int i=0 ; i<tls.length ; i++){
    tls[i].Activated=true;
  }
 }
 
 //public void Select(int x, int y){
 //SelectedTile = new int[]{x,y};
 //}
 
 public void doMove(sTile dest){
   //print("board do move");
 SelectedTile.pawn.doMove(dest);
 deactivateAll();
 }
 
 public void mouseMoved(){
   if (!isOn){return;}
   idleCount=0;
   //println("moved");
     for (int y=0; y<cellSize; y++){
       for (int x=0; x<cellSize; x++){      
        tiles[x][y].MoveMouse(mouseX-this.x, mouseY-this.y  );       
       }   
     } 
 }
 
  public void mousePressed(){
    if (!isOn){resetPosition();return;}
    idleCount=0;
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