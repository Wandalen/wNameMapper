( function _NameMapper_test_s( )
{

'use strict';

if( typeof module !== 'undefined' )
{

  let _ = require( './../../../wtools/Tools.s' );
  _.include( 'wTesting' );
  _.include( 'wFiles' );
  _.include( 'wConsequence' );

  require( './../l5_mapper/NameMapper.s' );

}

let _global = _global_;
let _ = _global_.wTools;
let Self = {};

// --
// context
// --

function suiteBegin()
{
  let context = this;
  context.suiteTempPath = _.path.tempOpen( _.path.join( __dirname, '../..' ), 'NameMapper' );
}

//

function suiteEnd()
{
  let context = this;
  _.assert( _.strHas( context.suiteTempPath, '/NameMapper-' ) )
  _.path.tempClose( context.suiteTempPath );
}

// --
// Tests
// --

function forKeyKeys( test )
{
  // var nameMapper = new wNameMapper().set
  // ({
  //   'string' : 'hello',
  //   'number' : 1,
  //   'boolean' : true,
  //   'object' : { a : 1 },
  //   'array' : [ 1, 'a', true ],
  //   'null' : null,
  // });

  var nameMapper2 = new wNameMapper().set
  (
    new Map ([
      [ 'string', 'hello' ],
      [ 'number', 1 ],
      [ 'boolean', true ],
      [ 'object', { a : 1 } ],
      [ 'array', [ 1, 'a', true ] ],
      [ 'null', null ],

      [ { a : 1 }, 'object' ],
      [ function a() {}, 'function' ],
      [ [ 'a', 1 ], 'array' ],
    ])
  );

  /* - */

  // test.case = 'forKey';
  // test.identical( nameMapper.forKey( 'string' ), 'hello' );
  // test.identical( nameMapper.forKey( 'number' ), 1 );
  // test.identical( nameMapper.forKey( 'boolean' ), true );
  // test.identical( nameMapper.forKey( 'object' ), { a : 1 } );
  // test.identical( nameMapper.forKey( 'null' ), null );
  // test.identical( nameMapper.forKey( 'array' ), [ 1, 'a', true ] );

  // /* */

  // test.case = 'forKeys';
  // test.identical( nameMapper.forKeys( 'string' ), 'hello' );
  // test.identical( nameMapper.forKeys( 'number' ), 1 );
  // test.identical( nameMapper.forKeys( 'boolean' ), true );
  // test.identical( nameMapper.forKeys( 'object' ), { a : 1 } );
  // test.identical( nameMapper.forKeys( 'null' ), null );
  // test.identical( nameMapper.forKeys( 'array' ), [ 1, 'a', true ] );

  /* */

  test.case = 'nameMapper from [object Map], forKey'

  debugger;
  test.identical( nameMapper2.forKey( 'string' ), 'hello' );
  // test.identical( nameMapper2.forKey( 'number' ), 1 );
  // test.identical( nameMapper2.forKey( 'boolean' ), true );
  // test.identical( nameMapper2.forKey( 'object' ), { a : 1 } );
  // test.identical( nameMapper2.forKey( 'null' ), null );
  // test.identical( nameMapper2.forKey( 'array' ), [ 1, 'a', true ] );

  // test.identical( nameMapper2.forKey({ a : 1 }), 'object' );
  // test.identical( nameMapper2.forKey( function a() {} ), 'function' );
  // test.identical( nameMapper2.forKey([ a, 1 ]), 'array' );

  // /* */

  // test.case = 'nameMapper from [object Map], forKeys'

  // test.identical( nameMapper2.forKeys( 'string' ), 'hello' );
  // test.identical( nameMapper2.forKeys( 'number' ), 1 );
  // test.identical( nameMapper2.forKeys( 'boolean' ), true );
  // test.identical( nameMapper2.forKeys( 'object' ), { a : 1 } );
  // test.identical( nameMapper2.forKeys( 'null' ), null );
  // test.identical( nameMapper2.forKeys( 'array' ), [ 1, 'a', true ] );

  // test.identical( nameMapper2.forKeys({ a : 1 }), 'object' );
  // test.identical( nameMapper2.forKeys( function a() {} ), 'function' );
  // test.identical( nameMapper2.forKeys([ 'a', 1 ]), 'array' );
}

/* */

function forValVals( test )
{
  var nameMapper = new wNameMapper().set
  ({
    'string' : 'hello',
    'number' : 1,
    'boolean' : true,
    'object' : { a : 1 },
    'array' : [ 1, 'a', true ],
    'null' : null,
  });

  test.case = 'forVal';
  test.identical( nameMapper.forVal( 'hello' ), 'string' );
  test.identical( nameMapper.forVal( 1 ), 'number' );
  test.identical( nameMapper.forVal( true ), 'boolean' );
  test.identical( nameMapper.forVal({ a : 1 }), 'object' );
  test.identical( nameMapper.forVal( null ), 'null' );
  test.identical( nameMapper.forVal( [ 1, 'a', true ] ), 'array' );

  /* */

  test.case = 'forVals primitive';
  test.identical( nameMapper.forVals( 'hello' ), 'string' );
  test.identical( nameMapper.forVals( 1 ), 'number' );
  test.identical( nameMapper.forVals( true ), 'boolean' );
  test.identical( nameMapper.forVals( null ), 'null' );

  /* */

  test.case = 'forVals with map';
  test.identical( nameMapper.forVals({ a : 'hello' }), { 'a' : 'string' } );
  test.identical( nameMapper.forVals({ a : 1 }), { 'a' : 'number' } );
  test.identical( nameMapper.forVals({ a : true }), { 'a' : 'boolean' } );
  test.identical( nameMapper.forVals({ a : { a : 1 } }), { 'a' : 'object' } );
  test.identical( nameMapper.forVals({ a : [ 1, 'a', true ] }), { 'a' : 'array' } );
  test.identical( nameMapper.forVals({ a : null }), { 'a' : 'null' } );
  test.identical( nameMapper.forVals({ a : 'hello', b : 1, c : true, d : { a : 1 }, e : [ 1, 'a', true ], f : null }), { a : 'string', b : 'number', c : 'boolean', d : 'object', e : 'array', f : 'null' } );

  /* */

  test.case = 'forVals with array';
  test.identical( nameMapper.forVals([ 'hello', 1, true, { a : 1 }, [ 1, 'a', true ], null ]), [ 'string', 'number', 'boolean', 'object', 'array', 'null' ] );
}

//

var Proto =
{

  name : 'Tools.l1.NameMapper',
  silencing : 1,
  routineTimeOut : 60000,
  onSuiteBegin : suiteBegin,
  onSuiteEnd : suiteEnd,

  context :
  {
    suiteTempPath : null,
    assetsOriginalPath : null,
    appJsPath : null,
  },

  tests :
  {
    forKeyKeys,
    forValVals
  }

}

_.mapExtend( Self, Proto );

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self )

})();
