/* @pjs pauseOnBlur="true"; */
sBoard theBoard;
int tileSize;
int boardSize;
int sSize=600;
PFont sansBig;
PFont sansSmall;

void setup(){
size(540,540);
sansBig = createFont( "SourceSansPro-Regular.ttf", 24);
sansSmall = createFont( "SourceSansPro-Regular.ttf", 12);

tileSize=60;
boardSize=tileSize*9;
theBoard=new sBoard( (int)(width-boardSize)/2 , (int)(height-boardSize)/2 );
theBoard.resetPosition();
/*
setupBoard(new char[][]{
{ 'R', '_','R', 'R', 'D', '_','_' },
{ '_', 'R','R', 'R', 'D', 'D','_' },
{ 'R', 'R','R', 'R', 'D', 'D','D' },
{ 'R', 'R','_', 'R', 'D', 'D','D' },
{ 'R', 'R','R', 'D', 'D', 'D','D' },
{ '_', 'R','R', 'D', 'D', 'D','_' },
{ '_', '_','R', 'D', 'D', '_','_' }
});
//println("Marbles: " + theBoard.countMarbles() );
*/


}

void draw(){
//translate(0,0);
background(255);
theBoard.draw();
}



void mouseMoved(){

theBoard.mouseMoved();
}


void mousePressed(){
theBoard.mousePressed();
}
///service



//call from JS
void setupBoardJS(String[][] bMap){
  theBoard.changePosition(bMap);
 
  }



int Sgn( int n){  //can not use java.Math
  if (n==0){return 0;}
  return n>0 ? 1 : -1;
}