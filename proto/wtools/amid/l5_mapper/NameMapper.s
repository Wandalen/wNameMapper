( function _NameMapper_s_( ) {

'use strict';

/**
 * Simple class to map names from one space to another and vice versa. Options for handling names collisions exist. Use the module to make your program shorter, more readable and to avoid typos.
  @module Tools/mid/NameMapper
*/

/**
 *  */

if( typeof module !== 'undefined' )
{

  let _ = require( '../../../wtools/Tools.s' );

  _.include( 'wCopyable' );

}

//

/**
 * @classdesc Simple class to map names from one space to another and vice versa.
 * @param {Object} o Options map for constructor. {@link module:Tools/mid/NameMapper.wNameMapper.Fields Options description }
 * @example
 * let mapper = new _.NameMapper({ leftName : 'kind of entity', rightName : 'name of routine' })
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

let _global = _global_;
let _ = _global_.wTools;
let Parent = null;
let Self = wNameMapper;
function wNameMapper( o )
{
  return _.workpiece.construct( Self, this, arguments );
}

Self.shortName = 'NameMapper';

// --
// inter
// --

function init( o )
{
  let self = this;

  _.assert( arguments.length === 0 || arguments.length === 1 );

  _.workpiece.initFields( self );

  if( o )
  self.copy( o );

  self.forVal = self._forVal.bind( self );
  self.forKey = self._forKey.bind( self );
  self.forVals = self._forVals.bind( self );
  self.forKeys = self._forKeys.bind( self );
  self.hasKey = self._hasKey.bind( self );
  self.hasVal = self._hasVal.bind( self );

  if( self.constructor === Self )
  Object.preventExtensions( self );
}

//

/**
 * @summary Maps names from one space to another and vice versa.
 * @description Expects at least one map with key:value pairs.
 * @example
 * let shortNameToLong  = new _.NameMapper().set
   ({
      'Tools' : 'wTools',
      'NameMapper' : 'wNameMapper',
   });
   shortNameToLong.forKey('NameMapper') // wNameMapper
   shortNameToLong.forVal('wTools') // Tools
 * @method set
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

function set()
{
  let self = this;

  _.assert( arguments.length > 0 );

  self.val = _.mapExtend( null, self.val );
  _.mapsExtend( self.val, arguments );

  if( self.droppingDuplicates )
  self.key = _.mapInvertDroppingDuplicates( self.val );
  else
  self.key = _.mapInvert( self.val );

  Object.freeze( self.val );
  Object.freeze( self.key );

  return self;
}

//

/**
 * @summary Returns key mapped with provided value `val`.
 * @example
 * let val  = new _.NameMapper().set
   ({
      'A' : 'B',
   });
   val.forVal('B') // A
 * @method forVal
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

function _forVal( val )
{
  let self = this;

  _.assert( arguments.length === 1, 'Expects single argument' );

  // if( !_.primitiveIs( val ) )
  // {
  //   debugger;
  //   return _.entityMap( val, function forVal( val )
  //   {
  //     return self.forVal( val );
  //   });
  // }

  if( self.asIsIfMiss && self.key[ val ] === undefined )
  return val;

  _.assert( self.key[ val ] !== undefined, () => 'Unknown ' + self.rightName + ' ' + val );

  return self.key[ val ];
}

//

/**
 * @summary Returns value mapped with provided key `key`.
 * @example
 * let val  = new _.NameMapper().set
   ({
      'A' : 'B',
   });
   val.forKey('A') // B
 * @method forKey
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

function _forKey( key )
{
  let self = this;

  _.assert( arguments.length === 1, 'Expects single argument' );

  // if( !_.primitiveIs( key ) )
  // {
  //   debugger;
  //   return _.entityMap( key, function forKey( key )
  //   {
  //     return self.forKey( key );
  //   });
  // }

  _.assert( _.strIs( key ) || _.numberIs( key ), 'Expects string or number {-key-}, but got', _.strType( key ) );

  if( self.asIsIfMiss && self.val[ key ] === undefined )
  return key;

  _.assert( self.val[ key ] !== undefined, () => 'Unknown ' + self.leftName + ' ' + _.strQuote( key ) );

  return self.val[ key ];
}

//

/**
 * @summary Returns key mapped with provided value `val`.
 * @example
 * let val  = new _.NameMapper().set
   ({
      'A' : 'B',
   });
   val.forVal('B') // A
 * @method forVals
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

function _forVals( val )
{
  let self = this;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.primitiveIs( val ) )
  {
    debugger;
    return _.map( val, function forVal( val )
    {
      return self._forVal( val );
    });
  }

  return self._forVal( val );
}

//

/**
 * @summary Returns value mapped with provided key `key`.
 * @example
 * let val  = new _.NameMapper().set
   ({
      'A' : 'B',
   });
   val.forKey('A') // B
 * @method forKeys
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

function _forKeys( key )
{
  let self = this;

  _.assert( arguments.length === 1, 'Expects single argument' );

  if( !_.primitiveIs( key ) )
  {
    debugger;
    return _.map( key, function forKey( key )
    {
      return self._forKey( key );
    });
  }

  return self._forKey( key );
}


//

/**
 * @summary Returns true if map has key:value pair with provided value `val`.
 * @example
 * let val  = new _.NameMapper().set
   ({
      'A' : 'B',
   });
   val.hasVal('A') // false
   val.hasVal('B') // true
 * @method hasVal
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

function _hasVal( val )
{
  let self = this;
  return self.key[ val ] !== undefined;
}

//

/**
 * @summary Returns true if map has key:value pair with provided key `key`.
 * @example
 * let val  = new _.NameMapper().set
   ({
      'A' : 'B',
   });
   val.hasKey('A') // true
   val.hasKey('B') // false
 * @method hasKey
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
*/

function _hasKey( key )
{
  let self = this;
  _.assert( _.strIs( key ) || _.numberIs( key ), 'Expects string or number {-key-}, but got', _.strType( key ) );
  return self.val[ key ] !== undefined;
}

/**
 * @typedef {Object} Fields
 * @property {Boolean} droppingDuplicates=1 Prevents duplication of keys.
 * @property {Boolean} asIsIfMiss=0 Return source value if key:value pair is not found.
 * @property {Object} val Container for mapped key:value pairs.
 * @property {Object} key Container for mapped value:key pairs.
 * @property {String} leftName='key' Description of left side of key:value pair.
 * @property {String} rightName='value' Description of right side of key:value pair.
 * @class wNameMapper
 * @namespace wTools
 * @module Tools/mid/NameMapper
 */

// --
// relations
// --

let Composes =
{
  droppingDuplicates : 1,
  asIsIfMiss : 0,
  val : _.define.own( {} ),
  key : _.define.own( {} ),
  leftName : 'key',
  rightName : 'value',
}

let Associates =
{
}

let Restricts =
{
}

// --
// declare
// --

let Proto =
{

  init,
  set,

  _forVal,
  _forKey,
  _forVals,
  _forKeys,
  _hasVal,
  _hasKey,

  // relations

  Composes,
  Associates,
  Restricts,

};

// define

_.classDeclare
({
  cls : Self,
  parent : Parent,
  extend : Proto,
});

_.Copyable.mixin( Self );

//

_[ Self.shortName ] = _global_[ Self.name ] = Self;
if( typeof module !== 'undefined' )
module[ 'exports' ] = Self;

})();
