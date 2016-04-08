sBoard theBoard;
int tileSize;
int boardSize;
int sSize=600;

void setup(){
size(600,600,P2D);
smooth();
tileSize=60;
boardSize=tileSize*9;
theBoard=new sBoard( (int)(width-boardSize)/2 , (int)(height-boardSize)/2 );
setupBoard(new char[][]{
{ '_', '_','R', 'R', 'R', '_','_' },
{ '_', 'R','R', 'R', 'R', 'R','_' },
{ 'R', 'R','R', '_', 'R', 'R','R' },
{ 'R', 'R','R', 'R', 'R', 'R','R' },
{ 'R', 'R','R', 'R', 'R', 'R','R' },
{ '_', 'R','R', 'R', 'R', 'R','_' },
{ '_', '_','R', 'R', 'R', '_','_' }
});
//println("Marbles: " + theBoard.countMarbles() );



}

void draw(){
//translate(0,0);
background(50);
theBoard.draw();
}



void mouseMoved(){

theBoard.mouseMoved();
}


void mousePressed(){
theBoard.mousePressed();
}
///service

void setupBoard(char[][] boardMap){
  
     for (int y=0; y<7; y++){
       for (int x=0; x<7; x++){ 
        if (boardMap[x][y] == 'R'){ //"R" for REGULAR
           theBoard.tiles[x][y].setPawn(new sPawn()); 
        }
       }   
     }
}

int Sgn( int n){  //can not use java.Math
  if (n==0){return 0;}
  return n>0 ? 1 : -1;
}