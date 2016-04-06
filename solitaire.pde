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
theBoard.tiles[5][5].setPawn(new sPawn());
theBoard.tiles[5][4].setPawn(new sPawn());
theBoard.tiles[6][4].setPawn(new sPawn());
theBoard.tiles[5][3].setPawn(new sPawn());
theBoard.tiles[6][3].setPawn(new sPawn());



}

void draw(){
//translate(0,0);
background(50);
theBoard.draw();
}

void mousePressed(){
//if click inside board
//translate coords to local
//pass to board
}

void mouseMoved(){

theBoard.mouseMoved();
}
///service

int Sgn( int n){  //can not use java.Math
  if (n==0){return 0;}
  return n>0 ? 1 : -1;
}