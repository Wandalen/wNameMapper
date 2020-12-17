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

//

var nameMapper = new wNameMapper().set
({
  'string' : 'hello',
  'number' : 1,
  'boolean' : true,
  'object' : { 'a' : 1 },
  'array' : [ 1, 'a', true ],
  'null' : null,
});

// --
// Tests
// --

function forKeyKeys( test )
{

  test.case = 'forKey';
  test.identical( nameMapper.forKey( 'string' ), 'hello' );
  test.identical( nameMapper.forKey( 'number' ), 1 );
  test.identical( nameMapper.forKey( 'boolean' ), true );
  test.identical( nameMapper.forKey( 'object' ), { 'a' : 1 } );
  test.identical( nameMapper.forKey( 'array' ), [ 1, 'a', true ] );
  test.identical( nameMapper.forKey( 'null' ), null );

  /* */

  test.case = 'forKeys primitive';
  test.identical( nameMapper.forKeys( 'string' ), 'hello' );
  test.identical( nameMapper.forKeys( 'number' ), 1 );
  test.identical( nameMapper.forKeys( 'boolean' ), true );
  test.identical( nameMapper.forKeys( 'object' ), { 'a' : 1 } );
  test.identical( nameMapper.forKeys( 'array' ), [ 1, 'a', true ] );
  test.identical( nameMapper.forKeys( 'null' ), null );

  /* */

  test.case = 'forKeys with map';
  var exp = { a : 'hello', b : 1, c : true, d : { 'a' : 1 }, e : [ 1, 'a', true ], f : null }
  test.identical( nameMapper.forKeys({ a : 'string', b : 'number', c : 'boolean', d : 'object', e : 'array', f : 'null' }), exp );

  /* */

  test.case = 'forKeys with array';
  var exp = [ 'hello', 1, true, { 'a' : 1 }, [ 1, 'a', true ], null ]
  test.identical( nameMapper.forKeys([ 'string', 'number', 'boolean', 'object', 'array', 'null' ]), exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments'
  test.shouldThrowErrorSync( () => nameMapper.forKey() )
  test.shouldThrowErrorSync( () => nameMapper.forKeys() )

  test.case = 'wrong key/s'
  test.shouldThrowErrorSync( () => nameMapper.forKey( 'non-existent' ) )
  test.shouldThrowErrorSync( () => nameMapper.forKeys([ 'non-existent1', 'non-existent2' ]) )

}

/* */

function forValVals( test )
{

  test.case = 'forVal';
  test.identical( nameMapper.forVal( 'hello' ), 'string' );
  test.identical( nameMapper.forVal( 1 ), 'number' );
  test.identical( nameMapper.forVal( true ), 'boolean' );
  test.identical( nameMapper.forVal({ 'a' : 1 }), 'object' );
  test.identical( nameMapper.forVal( [ 1, 'a', true ] ), 'array' );
  test.identical( nameMapper.forVal( null ), 'null' );

  /* */

  test.case = 'forVals primitive';
  test.identical( nameMapper.forVals( 'hello' ), 'string' );
  test.identical( nameMapper.forVals( 1 ), 'number' );
  test.identical( nameMapper.forVals( true ), 'boolean' );
  test.identical( nameMapper.forVals( null ), 'null' );

  /* */

  test.case = 'forVals with map';
  var exp = { a : 'string', b : 'number', c : 'boolean', d : 'object', e : 'array', f : 'null' };
  test.identical( nameMapper.forVals({ a : 'hello', b : 1, c : true, d : { 'a' : 1 }, e : [ 1, 'a', true ], f : null }), exp );

  /* */

  test.case = 'forVals with array';
  var exp = [ 'string', 'number', 'boolean', 'object', 'array', 'null' ]
  test.identical( nameMapper.forVals([ 'hello', 1, true, { 'a' : 1 }, [ 1, 'a', true ], null ]), exp );

  /* */

  if( !Config.debug )
  return;

  test.case = 'no arguments'
  test.shouldThrowErrorSync( () => nameMapper.forVal() )
  test.shouldThrowErrorSync( () => nameMapper.forVals() )

  test.case = 'wrong value/s'
  test.shouldThrowErrorSync( () => nameMapper.forVal( 'non-existent' ) )
  test.shouldThrowErrorSync( () => nameMapper.forVals([ 'non-existent1', 'non-existent2' ]) )
}

//

function hasValKey( test )
{

  test.case = 'hasKey';
  test.identical( nameMapper.hasKey( 'string' ), true )
  test.identical( nameMapper.hasKey( 'number' ), true )
  test.identical( nameMapper.hasKey( 'boolean' ), true )
  test.identical( nameMapper.hasKey( 'object' ), true )
  test.identical( nameMapper.hasKey( 'array' ), true )
  test.identical( nameMapper.hasKey( 'null' ), true )
  test.identical( nameMapper.hasKey( 'non-existent' ), false )

  /* */

  test.case = 'hasVal';
  test.identical( nameMapper.hasVal( 'hello' ), true )
  test.identical( nameMapper.hasVal( 1 ), true )
  test.identical( nameMapper.hasVal( true ), true )
  test.identical( nameMapper.hasVal({ 'a' : 1 }), true )
  test.identical( nameMapper.hasVal([ 1, 'a', true ]), true )
  test.identical( nameMapper.hasVal( null ), true )
  test.identical( nameMapper.hasVal( 'non-existent' ), false )

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
    nameMapper,
  },

  tests :
  {
    forKeyKeys,
    forValVals,
    hasValKey,
  }

}

_.mapExtend( Self, Proto );

//

Self = wTestSuite( Self );
if( typeof module !== 'undefined' && !module.parent )
wTester.test( Self )

})();
