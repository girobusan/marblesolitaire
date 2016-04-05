sBoard theBoard;

void settings(){
size(800,800);
}

void setup(){
theBoard=new sBoard(50,50,400);
}

void draw(){
background(0);
theBoard.draw();
}

void mousePressed(){
//if click inside board
//translate coords to local
//pass to board
}