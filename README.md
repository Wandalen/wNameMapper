
# wNameMapper [![Build Status](https://travis-ci.org/Wandalen/wNameMapper.svg?branch=master)](https://travis-ci.org/Wandalen/wNameMapper)

Simple class to map names from one space to another and vice versa. Options for handling names collisions exist. Use the module to make your program shorter, more readable and to avoid typos.

### Usage:

###### Simple Sample
```javascript

if( typeof module !== 'undefined' )
require( 'wNameMapper' );

var _ = wTools;

var nameMapper = new wNameMapper().set
({
  Points : 5001,
  LineStrip : 5002,
  LineLoop : 5003,
  Lines : 5004,
  TriangleStrip : 5005,
  TriangleFan : 5006,
  Triangles : 5007,
});

// console.log( 'nameMapper.valueToKeyMap',nameMapper.valueToKeyMap );
// console.log( 'nameMapper.keyToValueMap',nameMapper.keyToValueMap );

var valueForPoints = nameMapper.valFor( 'Points' )
console.log( 'valueForPoints :',valueForPoints );
// valueForPoints : 5001

var key = nameMapper.keyFor( valueForPoints )
console.log( 'key :',key );
// key : Points

var values = nameMapper.valFor([ 'Points','Lines' ])
console.log( 'values :',values );
// values : 5001, 5004

```

###### Sample of value space with duplicates
```javascript

var nameMapper = new wNameMapper({ droppingDuplicate : 1 }).set
({

  'exam' : 'discussion',
  'quiz' : 'problem',
  'supplement' : 'hypertext',
  'video' : 'video',

  'pdf' : 'downloadable',
  'subtitles' : 'downloadable',
  'asset' : 'downloadable',

  'lecture' : 'page',
  'section' : 'section',
  'week' : 'chapter',
  'course' : 'course',

});

var valueForExam = nameMapper.valFor( 'exam' )
console.log( 'valueForExam :',valueForExam );
// valueForExam : discussion

var valueForPdf = nameMapper.valFor( 'pdf' )
console.log( 'valueForPdf :',valueForPdf );
// valueForPdf : downloadable

try
{
  var values = nameMapper.keyFor( 'downloadable' )
}
catch( err )
{
  console.log( 'Unknown value downloadable, because this value has duplicates' )
}
```









































