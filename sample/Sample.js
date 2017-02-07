
if( typeof module !== 'undefined' )
require( 'wNameMapper' );

var _ = wTools;

var PrimitiveMapper = new wNameMapper
({
  Points : 5001,
  LineStrip : 5002,
  LineLoop : 5003,
  Lines : 5004,
  TriangleStrip : 5005,
  TriangleFan : 5006,
  Triangles : 5007,
});

var keyForPoints = PrimitiveMapper.keyFor( 'Points' )
console.log( 'keyForPoints :',keyForPoints );
// 5001

var value = PrimitiveMapper.valueFor( keyForPoints )
console.log( 'value :',value );
//

var keys = PrimitiveMapper.keyFor([ 'Points','Lines' ])
console.log( 'keys :',keys );
// 5001, 5004
