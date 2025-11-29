// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warbonds_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarbondsState {

 List<WarbondItem> get warbonds;
/// Create a copy of WarbondsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarbondsStateCopyWith<WarbondsState> get copyWith => _$WarbondsStateCopyWithImpl<WarbondsState>(this as WarbondsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarbondsState&&const DeepCollectionEquality().equals(other.warbonds, warbonds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(warbonds));

@override
String toString() {
  return 'WarbondsState(warbonds: $warbonds)';
}


}

/// @nodoc
abstract mixin class $WarbondsStateCopyWith<$Res>  {
  factory $WarbondsStateCopyWith(WarbondsState value, $Res Function(WarbondsState) _then) = _$WarbondsStateCopyWithImpl;
@useResult
$Res call({
 List<WarbondItem> warbonds
});




}
/// @nodoc
class _$WarbondsStateCopyWithImpl<$Res>
    implements $WarbondsStateCopyWith<$Res> {
  _$WarbondsStateCopyWithImpl(this._self, this._then);

  final WarbondsState _self;
  final $Res Function(WarbondsState) _then;

/// Create a copy of WarbondsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? warbonds = null,}) {
  return _then(_self.copyWith(
warbonds: null == warbonds ? _self.warbonds : warbonds // ignore: cast_nullable_to_non_nullable
as List<WarbondItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [WarbondsState].
extension WarbondsStatePatterns on WarbondsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarbondsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarbondsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarbondsState value)  $default,){
final _that = this;
switch (_that) {
case _WarbondsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarbondsState value)?  $default,){
final _that = this;
switch (_that) {
case _WarbondsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<WarbondItem> warbonds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarbondsState() when $default != null:
return $default(_that.warbonds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<WarbondItem> warbonds)  $default,) {final _that = this;
switch (_that) {
case _WarbondsState():
return $default(_that.warbonds);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<WarbondItem> warbonds)?  $default,) {final _that = this;
switch (_that) {
case _WarbondsState() when $default != null:
return $default(_that.warbonds);case _:
  return null;

}
}

}

/// @nodoc


class _WarbondsState implements WarbondsState {
  const _WarbondsState({final  List<WarbondItem> warbonds = const <WarbondItem>[]}): _warbonds = warbonds;
  

 final  List<WarbondItem> _warbonds;
@override@JsonKey() List<WarbondItem> get warbonds {
  if (_warbonds is EqualUnmodifiableListView) return _warbonds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warbonds);
}


/// Create a copy of WarbondsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarbondsStateCopyWith<_WarbondsState> get copyWith => __$WarbondsStateCopyWithImpl<_WarbondsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarbondsState&&const DeepCollectionEquality().equals(other._warbonds, _warbonds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_warbonds));

@override
String toString() {
  return 'WarbondsState(warbonds: $warbonds)';
}


}

/// @nodoc
abstract mixin class _$WarbondsStateCopyWith<$Res> implements $WarbondsStateCopyWith<$Res> {
  factory _$WarbondsStateCopyWith(_WarbondsState value, $Res Function(_WarbondsState) _then) = __$WarbondsStateCopyWithImpl;
@override @useResult
$Res call({
 List<WarbondItem> warbonds
});




}
/// @nodoc
class __$WarbondsStateCopyWithImpl<$Res>
    implements _$WarbondsStateCopyWith<$Res> {
  __$WarbondsStateCopyWithImpl(this._self, this._then);

  final _WarbondsState _self;
  final $Res Function(_WarbondsState) _then;

/// Create a copy of WarbondsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? warbonds = null,}) {
  return _then(_WarbondsState(
warbonds: null == warbonds ? _self._warbonds : warbonds // ignore: cast_nullable_to_non_nullable
as List<WarbondItem>,
  ));
}


}

// dart format on
