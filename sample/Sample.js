
if( typeof module !== 'undefined' )
require( 'wNameMapper' );

var _ = wTools;

var nameMapper = new wNameMapper
({
  Points : 5001,
  LineStrip : 5002,
  LineLoop : 5003,
  Lines : 5004,
  TriangleStrip : 5005,
  TriangleFan : 5006,
  Triangles : 5007,
});

var keyForPoints = nameMapper.keyFor( 'Points' )
console.log( 'keyForPoints :',keyForPoints );
// keyForPoints : 5001

var value = nameMapper.valueFor( keyForPoints )
console.log( 'value :',value );
// value : Points

var keys = nameMapper.keyFor([ 'Points','Lines' ])
console.log( 'keys :',keys );
// keys : 5001, 5004
