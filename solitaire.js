
var solitaire;
//positions

var Classic = [
[ '_', '_','R', 'R', 'R', '_','_' ],
[ '_', 'R','R', 'R', 'R', 'R','_' ],
[ 'R', 'R','R', 'R', 'R', 'R','R' ],
[ 'R', 'R','_', 'R', 'R', 'R','R' ],
[ 'R', 'R','R', 'R', 'R', 'R','R' ],
[ '_', 'R','R', 'R', 'R', 'R','_' ],
[ '_', '_','R', 'R', 'R', '_','_' ]
];

var AllDiagonal = [
[ '_', '_','D', 'D', 'D', '_','_' ],
[ '_', 'D','D', 'D', 'D', 'D','_' ],
[ 'D', 'D','D', 'D', 'D', 'D','D' ],
[ 'D', 'D','_', 'D', 'D', 'D','D' ],
[ 'D', 'D','D', 'D', 'D', 'D','D' ],
[ '_', 'D','D', 'D', 'D', 'D','_' ],
[ '_', '_','D', 'D', 'D', '_','_' ]
];

var CheckerLike = [
[ '_', '_','D', 'R', 'D', '_','_' ],
[ '_', 'D','R', 'D', 'R', 'D','_' ],
[ 'D', 'R','D', 'R', 'D', 'R','D' ],
[ 'R', 'D','_', 'D', 'R', 'D','R' ],
[ 'D', 'R','D', 'R', 'D', 'R','D' ],
[ '_', 'D','R', 'D', 'R', 'D','_' ],
[ '_', '_','D', 'R', 'D', '_','_' ]
];

var CenteredCheckerLike = [
[ '_', '_','D', 'R', 'D', '_','_' ],
[ '_', 'D','R', 'D', 'R', 'D','_' ],
[ 'D', 'R','D', 'R', 'D', 'R','D' ],
[ 'R', 'D','R', '_', 'R', 'D','R' ],
[ 'D', 'R','D', 'R', 'D', 'R','D' ],
[ '_', 'D','R', 'D', 'R', 'D','_' ],
[ '_', '_','D', 'R', 'D', '_','_' ]
];

var CheckerLike2 = [
[ '_', '_','R', 'D', 'R', '_','_' ],
[ '_', 'R','D', 'R', 'D', 'R','_' ],
[ 'R', 'D','R', 'D', 'R', 'D','R' ],
[ 'D', 'R','_', 'R', 'D', 'R','D' ],
[ 'R', 'D','R', 'D', 'R', 'D','R' ],
[ '_', 'R','D', 'R', 'D', 'R','_' ],
[ '_', '_','R', 'D', 'R', '_','_' ]
];

var CenteredCheckerLike2 = [
[ '_', '_','R', 'D', 'R', '_','_' ],
[ '_', 'R','D', 'R', 'D', 'R','_' ],
[ 'R', 'D','R', 'D', 'R', 'D','R' ],
[ 'D', 'R','D', '_', 'D', 'R','D' ],
[ 'R', 'D','R', 'D', 'R', 'D','R' ],
[ '_', 'R','D', 'R', 'D', 'R','_' ],
[ '_', '_','R', 'D', 'R', '_','_' ]
];

var Default = [
  [ '_', '_','R', 'R', 'D', '_','_' ],
  [ '_', 'R','R', 'R', 'D', 'D','_' ],
  [ 'R', 'R','R', 'R', 'D', 'D','D' ],
  [ 'R', 'R','_', 'R', 'D', 'D','D' ],
  [ 'R', 'R','R', 'D', 'D', 'D','D' ],
  [ '_', 'R','R', 'D', 'D', 'D','_' ],
  [ '_', '_','R', 'D', 'D', '_','_' ]
];

var DefaultCentered = [
  [ '_', '_','R', 'R', 'D', '_','_' ],
  [ '_', 'R','R', 'R', 'D', 'D','_' ],
  [ 'R', 'R','R', 'R', 'D', 'D','D' ],
  [ 'R', 'R','R', '_', 'D', 'D','D' ],
  [ 'R', 'R','R', 'D', 'D', 'D','D' ],
  [ '_', 'R','R', 'D', 'D', 'D','_' ],
  [ '_', '_','R', 'D', 'D', '_','_' ]
];

var Empty = [
  [ '_', '_','_', '_', '_', '_','_' ],
  [ '_', '_','_', '_', '_', '_','_' ],
  [ '_', '_','_', '_', '_', '_','_' ],
  [ '_', '_','_', '_', '_', '_','_' ],
  [ '_', '_','_', '_', '_', '_','_' ],
  [ '_', '_','_', '_', '_', '_','_' ],
  [ '_', '_','_', '_', '_', '_','_' ]
];



function SetBoard(a){
  var s = Processing.getInstanceById("solitaire");
  s.setupBoardJS(a);
}

function doShuffle(){
var sa = Empty.slice();
for (var x=0 ; x<7 ; x++){
for (var y=0 ; y<7 ; y++){
 sa[x][y] = Math.random()>0.5 ? 'R' : 'D' ;

}

}
sa[3][3] = '_';
return sa;
}
