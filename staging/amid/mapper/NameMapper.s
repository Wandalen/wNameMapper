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

  self.keyToValueMap = _.mapExtend( {},self.keyToValueMap );
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

function keyFor( value )
{
  var self = this;

  _.assert( arguments.length === 1 );

  if( !_.atomicIs( value ) )
  {
    debugger;
    return _.entityMap( value,function keyFor( value )
    {
      _.assert( self.valueToKeyMap[ value ] !== undefined,'Unknown value',value );
      return self.valueToKeyMap[ value ];
    });
  }

  _.assert( self.valueToKeyMap[ value ] !== undefined,'Unknown value',value );
  return self.valueToKeyMap[ value ];
}

//

function valueFor( key )
{
  var self = this;

  _.assert( arguments.length === 1 );

  if( !_.atomicIs( key ) )
  {
    debugger;
    return _.entityMap( key,function valueFor( key )
    {
      _.assert( self.keyToValueMap[ key ] !== undefined,'Unknown key',key );
      return self.keyToValueMap[ key ];
    });
  }

  _.assert( self.keyToValueMap[ key ] !== undefined,'Unknown key',key );
  return self.keyToValueMap[ key ];
}

// --
// relationships
// --

var Composes =
{
  droppingDuplicate : 1,
  keyToValueMap : {},
  valueToKeyMap : {},
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
  valueFor : valueFor,

  // relationships

  constructor : Self,
  Composes : Composes,
  Associates : Associates,
  Restricts : Restricts,

};

// define

_.protoMake
({
  constructor : Self,
  parent : Parent,
  extend : Proto,
});

wCopyable.mixin( Self );

wTools[ Self.nameShort ] = _global_[ Self.name ] = Self;

//

})();
