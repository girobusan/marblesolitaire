sBoard theBoard;
int tileSize;
int boardSize;
int sSize=600;

void settings(){
size(600,600);
}

void setup(){
size(600,600);
tileSize=60;
boardSize=tileSize*9;
theBoard=new sBoard( (width-boardSize)/2 , (height-boardSize)/2 );


}

void draw(){
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