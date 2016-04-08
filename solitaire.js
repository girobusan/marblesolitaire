
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

var Default = [
  [ '_', '_','R', 'R', 'D', '_','_' ],
  [ '_', 'R','R', 'R', 'D', 'D','_' ],
  [ 'R', 'R','R', 'R', 'D', 'D','D' ],
  [ 'R', 'R','_', 'R', 'D', 'D','D' ],
  [ 'R', 'R','R', 'D', 'D', 'D','D' ],
  [ '_', 'R','R', 'D', 'D', 'D','_' ],
  [ '_', '_','R', 'D', 'D', '_','_' ]
];

function sinit(){
 solitaire = Processing.getInstanceById("solitaire");
}