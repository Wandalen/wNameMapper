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

function init( keyToValueMap )
{
  var self = this;

  // if( o )
  // self.copy( o );

  if( arguments.length > 1 )
  _.mapExtendThis.apply( {},arguments );

  _.assert( _.objectIs( keyToValueMap ),'wNameMapper expects object as argument' );

  // _.assert( _.objectIs( self.keyToValueMap ) || _.objectIs( self.valueToKeyMap ),'Mapper : expects keyToValueMap or valueToKeyMap' );

  self.keyToValueMap = keyToValueMap;
  self.valueToKeyMap = _.mapInvertKeyValue( self.keyToValueMap );

  // if( !self.keyToValueMap )
  // self.keyToValueMap = _.mapInvertKeyValue( self.valueToKeyMap );
  //
  // if( !self.valueToKeyMap )
  // self.valueToKeyMap = _.mapInvertKeyValue( self.keyToValueMap );

  /* seal it */

  if( self.constructor === Self )
  {
    Object.freeze( self );
    Object.freeze( self.keyToValueMap );
    Object.freeze( self.valueToKeyMap );
  }

}

//

function keyFor( value )
{
  var self = this;

  _.assert( arguments.length === 1 );

  if( _.objectIs( value ) || _.arrayIs( value ) )
  {
    debugger;
    _.entityMap( value,function keyFor( value )
    {
      _.assert( self.valueToKeyMap[ value ] !== undefined,'unknown value',value );
      return self.valueToKeyMap[ value ];
    });
  }

  _.assert( self.valueToKeyMap[ value ] !== undefined,'unknown value',value );
  return self.valueToKeyMap[ value ];
}

//

function valueFor( key )
{
  var self = this;

  _.assert( arguments.length === 1 );

  if( _.objectIs( key ) || _.arrayIs( key ) )
  {
    debugger;
    _.entityMap( key,function keyFor( key )
    {
      _.assert( self.keyToValueMap[ key ] !== undefined,'unknown key',key );
      return self.keyToValueMap[ key ];
    });
  }

  _.assert( self.keyToValueMap[ key ] !== undefined,'unknown key',key );
  return self.keyToValueMap[ key ];
}

// --
// relationships
// --

var Composes =
{
  keyToValueMap : null,
  valueToKeyMap : null,
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

// accessor

// _.accessor( Self.prototype,
// {
//
//   // defaultFieldsArray : 'defaultFieldsArray',
//
// });
//
// // readonly
//
// _.accessorReadOnly( Self.prototype,
// {
//
//   // names : 'names',
//   // defaultFieldsMap : 'defaultFieldsMap',
//
// });

wTools[ Self.nameShort ] = _global_[ Self.name ] = Self;

})();
