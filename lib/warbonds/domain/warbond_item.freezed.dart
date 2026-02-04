// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'warbond_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WarbondItem {

/// The name of the warbond.
 String get name;/// The path to the image representing the warbond.
 String get imagePath;/// The number of pages in the warbond.
 int get pages;/// The display order of the warbond.
 int get order;/// The cost of the warbond in Super Credits.
 int get credits;/// Unique identifier for the warbond.
 String get id;
/// Create a copy of WarbondItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WarbondItemCopyWith<WarbondItem> get copyWith => _$WarbondItemCopyWithImpl<WarbondItem>(this as WarbondItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WarbondItem&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.order, order) || other.order == order)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,name,imagePath,pages,order,credits,id);

@override
String toString() {
  return 'WarbondItem(name: $name, imagePath: $imagePath, pages: $pages, order: $order, credits: $credits, id: $id)';
}


}

/// @nodoc
abstract mixin class $WarbondItemCopyWith<$Res>  {
  factory $WarbondItemCopyWith(WarbondItem value, $Res Function(WarbondItem) _then) = _$WarbondItemCopyWithImpl;
@useResult
$Res call({
 String name, String imagePath, int pages, int order, int credits, String id
});




}
/// @nodoc
class _$WarbondItemCopyWithImpl<$Res>
    implements $WarbondItemCopyWith<$Res> {
  _$WarbondItemCopyWithImpl(this._self, this._then);

  final WarbondItem _self;
  final $Res Function(WarbondItem) _then;

/// Create a copy of WarbondItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? imagePath = null,Object? pages = null,Object? order = null,Object? credits = null,Object? id = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [WarbondItem].
extension WarbondItemPatterns on WarbondItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _WarbondItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _WarbondItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _WarbondItem value)  $default,){
final _that = this;
switch (_that) {
case _WarbondItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _WarbondItem value)?  $default,){
final _that = this;
switch (_that) {
case _WarbondItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String imagePath,  int pages,  int order,  int credits,  String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _WarbondItem() when $default != null:
return $default(_that.name,_that.imagePath,_that.pages,_that.order,_that.credits,_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String imagePath,  int pages,  int order,  int credits,  String id)  $default,) {final _that = this;
switch (_that) {
case _WarbondItem():
return $default(_that.name,_that.imagePath,_that.pages,_that.order,_that.credits,_that.id);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String imagePath,  int pages,  int order,  int credits,  String id)?  $default,) {final _that = this;
switch (_that) {
case _WarbondItem() when $default != null:
return $default(_that.name,_that.imagePath,_that.pages,_that.order,_that.credits,_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _WarbondItem implements WarbondItem {
  const _WarbondItem({this.name = "", this.imagePath = "", this.pages = 1, this.order = 1, this.credits = 1, this.id = ""});
  

/// The name of the warbond.
@override@JsonKey() final  String name;
/// The path to the image representing the warbond.
@override@JsonKey() final  String imagePath;
/// The number of pages in the warbond.
@override@JsonKey() final  int pages;
/// The display order of the warbond.
@override@JsonKey() final  int order;
/// The cost of the warbond in Super Credits.
@override@JsonKey() final  int credits;
/// Unique identifier for the warbond.
@override@JsonKey() final  String id;

/// Create a copy of WarbondItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WarbondItemCopyWith<_WarbondItem> get copyWith => __$WarbondItemCopyWithImpl<_WarbondItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _WarbondItem&&(identical(other.name, name) || other.name == name)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.pages, pages) || other.pages == pages)&&(identical(other.order, order) || other.order == order)&&(identical(other.credits, credits) || other.credits == credits)&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,name,imagePath,pages,order,credits,id);

@override
String toString() {
  return 'WarbondItem(name: $name, imagePath: $imagePath, pages: $pages, order: $order, credits: $credits, id: $id)';
}


}

/// @nodoc
abstract mixin class _$WarbondItemCopyWith<$Res> implements $WarbondItemCopyWith<$Res> {
  factory _$WarbondItemCopyWith(_WarbondItem value, $Res Function(_WarbondItem) _then) = __$WarbondItemCopyWithImpl;
@override @useResult
$Res call({
 String name, String imagePath, int pages, int order, int credits, String id
});




}
/// @nodoc
class __$WarbondItemCopyWithImpl<$Res>
    implements _$WarbondItemCopyWith<$Res> {
  __$WarbondItemCopyWithImpl(this._self, this._then);

  final _WarbondItem _self;
  final $Res Function(_WarbondItem) _then;

/// Create a copy of WarbondItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? imagePath = null,Object? pages = null,Object? order = null,Object? credits = null,Object? id = null,}) {
  return _then(_WarbondItem(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,pages: null == pages ? _self.pages : pages // ignore: cast_nullable_to_non_nullable
as int,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,credits: null == credits ? _self.credits : credits // ignore: cast_nullable_to_non_nullable
as int,id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
