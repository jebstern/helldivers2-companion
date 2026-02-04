// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'titles_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TitlesState {

 List<PlayerTitle> get titles;
/// Create a copy of TitlesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TitlesStateCopyWith<TitlesState> get copyWith => _$TitlesStateCopyWithImpl<TitlesState>(this as TitlesState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TitlesState&&const DeepCollectionEquality().equals(other.titles, titles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(titles));

@override
String toString() {
  return 'TitlesState(titles: $titles)';
}


}

/// @nodoc
abstract mixin class $TitlesStateCopyWith<$Res>  {
  factory $TitlesStateCopyWith(TitlesState value, $Res Function(TitlesState) _then) = _$TitlesStateCopyWithImpl;
@useResult
$Res call({
 List<PlayerTitle> titles
});




}
/// @nodoc
class _$TitlesStateCopyWithImpl<$Res>
    implements $TitlesStateCopyWith<$Res> {
  _$TitlesStateCopyWithImpl(this._self, this._then);

  final TitlesState _self;
  final $Res Function(TitlesState) _then;

/// Create a copy of TitlesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? titles = null,}) {
  return _then(_self.copyWith(
titles: null == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as List<PlayerTitle>,
  ));
}

}


/// Adds pattern-matching-related methods to [TitlesState].
extension TitlesStatePatterns on TitlesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TitlesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TitlesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TitlesState value)  $default,){
final _that = this;
switch (_that) {
case _TitlesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TitlesState value)?  $default,){
final _that = this;
switch (_that) {
case _TitlesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PlayerTitle> titles)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TitlesState() when $default != null:
return $default(_that.titles);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PlayerTitle> titles)  $default,) {final _that = this;
switch (_that) {
case _TitlesState():
return $default(_that.titles);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PlayerTitle> titles)?  $default,) {final _that = this;
switch (_that) {
case _TitlesState() when $default != null:
return $default(_that.titles);case _:
  return null;

}
}

}

/// @nodoc


class _TitlesState implements TitlesState {
  const _TitlesState({final  List<PlayerTitle> titles = const <PlayerTitle>[]}): _titles = titles;


 final  List<PlayerTitle> _titles;
@override@JsonKey() List<PlayerTitle> get titles {
  if (_titles is EqualUnmodifiableListView) return _titles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_titles);
}


/// Create a copy of TitlesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TitlesStateCopyWith<_TitlesState> get copyWith => __$TitlesStateCopyWithImpl<_TitlesState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TitlesState&&const DeepCollectionEquality().equals(other._titles, _titles));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_titles));

@override
String toString() {
  return 'TitlesState(titles: $titles)';
}


}

/// @nodoc
abstract mixin class _$TitlesStateCopyWith<$Res> implements $TitlesStateCopyWith<$Res> {
  factory _$TitlesStateCopyWith(_TitlesState value, $Res Function(_TitlesState) _then) = __$TitlesStateCopyWithImpl;
@override @useResult
$Res call({
 List<PlayerTitle> titles
});




}
/// @nodoc
class __$TitlesStateCopyWithImpl<$Res>
    implements _$TitlesStateCopyWith<$Res> {
  __$TitlesStateCopyWithImpl(this._self, this._then);

  final _TitlesState _self;
  final $Res Function(_TitlesState) _then;

/// Create a copy of TitlesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? titles = null,}) {
  return _then(_TitlesState(
titles: null == titles ? _self._titles : titles // ignore: cast_nullable_to_non_nullable
as List<PlayerTitle>,
  ));
}


}

// dart format on
