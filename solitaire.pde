sBoard theBoard;
int tileSize;
int boardSize;
int sSize=600;

void setup(){
size(600,600,P2D);
tileSize=60;
boardSize=tileSize*9;
theBoard=new sBoard( (int)(width-boardSize)/2 , (int)(height-boardSize)/2 );


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