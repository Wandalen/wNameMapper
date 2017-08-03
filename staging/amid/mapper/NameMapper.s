( function _NameMapper_s_( ) {

'use strict';

if( typeof wBase === 'undefined' )
try
{
  require( '../../abase/wTools.s' );
}
catch( err )
{
  require( 'wTools' );
}

var _ = wTools;

_.include( 'wCopyable' );

//

var Parent = null;
var Self = function wNameMapper( o )
{
  if( !( this instanceof Self ) )
  if( o instanceof Self )
  return o;
  else
  return new( _.routineJoin( Self, Self, arguments ) );
  return Self.prototype.init.apply( this,arguments );
}

Self.nameShort = 'NameMapper';

// --
// inter
// --

function init( o )
{
  var self = this;

  _.assert( arguments.length === 0 || arguments.length === 1 );

  _.instanceInit( self );

  if( o )
  self.copy( o );

  /* seal it */

  if( self.constructor === Self )
  Object.preventExtensions( self );

}

//

function set()
{
  var self = this;

  _.assert( arguments.length > 0 );

  self.keyToValueMap = _.mapExtend( null,self.keyToValueMap );
  _.mapExtendToThis.apply( self.keyToValueMap,arguments );

  if( self.droppingDuplicate )
  self.valueToKeyMap = _.mapInvertDroppingDuplicates( self.keyToValueMap );
  else
  self.valueToKeyMap = _.mapInvert( self.keyToValueMap );

  Object.freeze( self.keyToValueMap );
  Object.freeze( self.valueToKeyMap );

  return self;
}

//

function keyFor( val )
{
  var self = this;

  _.assert( arguments.length === 1 );

  if( !_.atomicIs( val ) )
  {
    debugger;
    return _.entityMap( val,function keyFor( val )
    {
      return self.keyFor( val );
    });
  }

  if( self.asIsIfMiss && self.valueToKeyMap[ val ] === undefined )
  return val;

  _.assert( self.valueToKeyMap[ val ] !== undefined,'Unknown value',val );
  return self.valueToKeyMap[ val ];
}

//

function valFor( key )
{
  var self = this;

  _.assert( _.strIs( key ) || _.numberIs( key ) );
  _.assert( arguments.length === 1 );

  if( !_.atomicIs( key ) )
  {
    debugger;
    return _.entityMap( key,function valFor( key )
    {
      return self.valFor( key );
    });
  }

  if( self.asIsIfMiss && self.keyToValueMap[ key ] === undefined )
  return key;

  _.assert( self.keyToValueMap[ key ] !== undefined,'Unknown key',key );

  return self.keyToValueMap[ key ];
}

//

function hasKey( key )
{
  var self = this;
  return self.keyToValueMap[ key ] !== undefined;
}

//

function hasVal( val )
{
  var self = this;
  return _.mapVals( self.keyToValueMap ).indexOf( val ) !== -1;
}

// --
// relationships
// --

var Composes =
{
  droppingDuplicate : 1,
  asIsIfMiss : 0,
  keyToValueMap : Object.create( null ),
  valueToKeyMap : Object.create( null ),
}

var Associates =
{
}

var Restricts =
{
}

// --
// proto
// --

var Proto =
{

  init : init,
  set : set,

  keyFor : keyFor,
  valFor : valFor,

  hasKey : hasKey,
  hasVal : hasVal,

  // relationships

  constructor : Self,
  Composes : Composes,
  Associates : Associates,
  Restricts : Restricts,

};

// define

_.prototypeMake
({
  cls : Self,
  parent : Parent,
  extend : Proto,
});

//

wCopyable.mixin( Self );

wTools[ Self.nameShort ] = _global_[ Self.name ] = Self;

if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
