// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Failure {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Failure);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure()';
}


}

/// @nodoc
class $FailureCopyWith<$Res>  {
$FailureCopyWith(Failure _, $Res Function(Failure) __);
}


/// Adds pattern-matching-related methods to [Failure].
extension FailurePatterns on Failure {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HttpBadRequest value)?  httpBadRequest,TResult Function( HttpUnauthorized value)?  httpUnauthorized,TResult Function( HttpNotFound value)?  httpNotFound,TResult Function( HttpServerError value)?  httpServerError,TResult Function( HttpGeneralError value)?  httpGeneralError,TResult Function( SerialisationError value)?  serialisationError,TResult Function( GeneralGraphQLError value)?  generalGraphQLError,TResult Function( NullValueError value)?  nullValueError,TResult Function( NoResidenceError value)?  noResidenceError,TResult Function( FailureException value)?  exception,TResult Function( AuthCancelledByUser value)?  authCancelledByUser,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HttpBadRequest() when httpBadRequest != null:
return httpBadRequest(_that);case HttpUnauthorized() when httpUnauthorized != null:
return httpUnauthorized(_that);case HttpNotFound() when httpNotFound != null:
return httpNotFound(_that);case HttpServerError() when httpServerError != null:
return httpServerError(_that);case HttpGeneralError() when httpGeneralError != null:
return httpGeneralError(_that);case SerialisationError() when serialisationError != null:
return serialisationError(_that);case GeneralGraphQLError() when generalGraphQLError != null:
return generalGraphQLError(_that);case NullValueError() when nullValueError != null:
return nullValueError(_that);case NoResidenceError() when noResidenceError != null:
return noResidenceError(_that);case FailureException() when exception != null:
return exception(_that);case AuthCancelledByUser() when authCancelledByUser != null:
return authCancelledByUser(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HttpBadRequest value)  httpBadRequest,required TResult Function( HttpUnauthorized value)  httpUnauthorized,required TResult Function( HttpNotFound value)  httpNotFound,required TResult Function( HttpServerError value)  httpServerError,required TResult Function( HttpGeneralError value)  httpGeneralError,required TResult Function( SerialisationError value)  serialisationError,required TResult Function( GeneralGraphQLError value)  generalGraphQLError,required TResult Function( NullValueError value)  nullValueError,required TResult Function( NoResidenceError value)  noResidenceError,required TResult Function( FailureException value)  exception,required TResult Function( AuthCancelledByUser value)  authCancelledByUser,}){
final _that = this;
switch (_that) {
case HttpBadRequest():
return httpBadRequest(_that);case HttpUnauthorized():
return httpUnauthorized(_that);case HttpNotFound():
return httpNotFound(_that);case HttpServerError():
return httpServerError(_that);case HttpGeneralError():
return httpGeneralError(_that);case SerialisationError():
return serialisationError(_that);case GeneralGraphQLError():
return generalGraphQLError(_that);case NullValueError():
return nullValueError(_that);case NoResidenceError():
return noResidenceError(_that);case FailureException():
return exception(_that);case AuthCancelledByUser():
return authCancelledByUser(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HttpBadRequest value)?  httpBadRequest,TResult? Function( HttpUnauthorized value)?  httpUnauthorized,TResult? Function( HttpNotFound value)?  httpNotFound,TResult? Function( HttpServerError value)?  httpServerError,TResult? Function( HttpGeneralError value)?  httpGeneralError,TResult? Function( SerialisationError value)?  serialisationError,TResult? Function( GeneralGraphQLError value)?  generalGraphQLError,TResult? Function( NullValueError value)?  nullValueError,TResult? Function( NoResidenceError value)?  noResidenceError,TResult? Function( FailureException value)?  exception,TResult? Function( AuthCancelledByUser value)?  authCancelledByUser,}){
final _that = this;
switch (_that) {
case HttpBadRequest() when httpBadRequest != null:
return httpBadRequest(_that);case HttpUnauthorized() when httpUnauthorized != null:
return httpUnauthorized(_that);case HttpNotFound() when httpNotFound != null:
return httpNotFound(_that);case HttpServerError() when httpServerError != null:
return httpServerError(_that);case HttpGeneralError() when httpGeneralError != null:
return httpGeneralError(_that);case SerialisationError() when serialisationError != null:
return serialisationError(_that);case GeneralGraphQLError() when generalGraphQLError != null:
return generalGraphQLError(_that);case NullValueError() when nullValueError != null:
return nullValueError(_that);case NoResidenceError() when noResidenceError != null:
return noResidenceError(_that);case FailureException() when exception != null:
return exception(_that);case AuthCancelledByUser() when authCancelledByUser != null:
return authCancelledByUser(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  httpBadRequest,TResult Function()?  httpUnauthorized,TResult Function()?  httpNotFound,TResult Function()?  httpServerError,TResult Function( String? message)?  httpGeneralError,TResult Function()?  serialisationError,TResult Function( List<String>? messages)?  generalGraphQLError,TResult Function()?  nullValueError,TResult Function()?  noResidenceError,TResult Function( String? message)?  exception,TResult Function()?  authCancelledByUser,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HttpBadRequest() when httpBadRequest != null:
return httpBadRequest();case HttpUnauthorized() when httpUnauthorized != null:
return httpUnauthorized();case HttpNotFound() when httpNotFound != null:
return httpNotFound();case HttpServerError() when httpServerError != null:
return httpServerError();case HttpGeneralError() when httpGeneralError != null:
return httpGeneralError(_that.message);case SerialisationError() when serialisationError != null:
return serialisationError();case GeneralGraphQLError() when generalGraphQLError != null:
return generalGraphQLError(_that.messages);case NullValueError() when nullValueError != null:
return nullValueError();case NoResidenceError() when noResidenceError != null:
return noResidenceError();case FailureException() when exception != null:
return exception(_that.message);case AuthCancelledByUser() when authCancelledByUser != null:
return authCancelledByUser();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  httpBadRequest,required TResult Function()  httpUnauthorized,required TResult Function()  httpNotFound,required TResult Function()  httpServerError,required TResult Function( String? message)  httpGeneralError,required TResult Function()  serialisationError,required TResult Function( List<String>? messages)  generalGraphQLError,required TResult Function()  nullValueError,required TResult Function()  noResidenceError,required TResult Function( String? message)  exception,required TResult Function()  authCancelledByUser,}) {final _that = this;
switch (_that) {
case HttpBadRequest():
return httpBadRequest();case HttpUnauthorized():
return httpUnauthorized();case HttpNotFound():
return httpNotFound();case HttpServerError():
return httpServerError();case HttpGeneralError():
return httpGeneralError(_that.message);case SerialisationError():
return serialisationError();case GeneralGraphQLError():
return generalGraphQLError(_that.messages);case NullValueError():
return nullValueError();case NoResidenceError():
return noResidenceError();case FailureException():
return exception(_that.message);case AuthCancelledByUser():
return authCancelledByUser();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  httpBadRequest,TResult? Function()?  httpUnauthorized,TResult? Function()?  httpNotFound,TResult? Function()?  httpServerError,TResult? Function( String? message)?  httpGeneralError,TResult? Function()?  serialisationError,TResult? Function( List<String>? messages)?  generalGraphQLError,TResult? Function()?  nullValueError,TResult? Function()?  noResidenceError,TResult? Function( String? message)?  exception,TResult? Function()?  authCancelledByUser,}) {final _that = this;
switch (_that) {
case HttpBadRequest() when httpBadRequest != null:
return httpBadRequest();case HttpUnauthorized() when httpUnauthorized != null:
return httpUnauthorized();case HttpNotFound() when httpNotFound != null:
return httpNotFound();case HttpServerError() when httpServerError != null:
return httpServerError();case HttpGeneralError() when httpGeneralError != null:
return httpGeneralError(_that.message);case SerialisationError() when serialisationError != null:
return serialisationError();case GeneralGraphQLError() when generalGraphQLError != null:
return generalGraphQLError(_that.messages);case NullValueError() when nullValueError != null:
return nullValueError();case NoResidenceError() when noResidenceError != null:
return noResidenceError();case FailureException() when exception != null:
return exception(_that.message);case AuthCancelledByUser() when authCancelledByUser != null:
return authCancelledByUser();case _:
  return null;

}
}

}

/// @nodoc


class HttpBadRequest implements Failure {
  const HttpBadRequest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpBadRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.httpBadRequest()';
}


}




/// @nodoc


class HttpUnauthorized implements Failure {
  const HttpUnauthorized();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpUnauthorized);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.httpUnauthorized()';
}


}




/// @nodoc


class HttpNotFound implements Failure {
  const HttpNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.httpNotFound()';
}


}




/// @nodoc


class HttpServerError implements Failure {
  const HttpServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.httpServerError()';
}


}




/// @nodoc


class HttpGeneralError implements Failure {
  const HttpGeneralError([this.message]);
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HttpGeneralErrorCopyWith<HttpGeneralError> get copyWith => _$HttpGeneralErrorCopyWithImpl<HttpGeneralError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HttpGeneralError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.httpGeneralError(message: $message)';
}


}

/// @nodoc
abstract mixin class $HttpGeneralErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $HttpGeneralErrorCopyWith(HttpGeneralError value, $Res Function(HttpGeneralError) _then) = _$HttpGeneralErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$HttpGeneralErrorCopyWithImpl<$Res>
    implements $HttpGeneralErrorCopyWith<$Res> {
  _$HttpGeneralErrorCopyWithImpl(this._self, this._then);

  final HttpGeneralError _self;
  final $Res Function(HttpGeneralError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(HttpGeneralError(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class SerialisationError implements Failure {
  const SerialisationError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SerialisationError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.serialisationError()';
}


}




/// @nodoc


class GeneralGraphQLError implements Failure {
  const GeneralGraphQLError([final  List<String>? messages]): _messages = messages;
  

 final  List<String>? _messages;
 List<String>? get messages {
  final value = _messages;
  if (value == null) return null;
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GeneralGraphQLErrorCopyWith<GeneralGraphQLError> get copyWith => _$GeneralGraphQLErrorCopyWithImpl<GeneralGraphQLError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GeneralGraphQLError&&const DeepCollectionEquality().equals(other._messages, _messages));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages));

@override
String toString() {
  return 'Failure.generalGraphQLError(messages: $messages)';
}


}

/// @nodoc
abstract mixin class $GeneralGraphQLErrorCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $GeneralGraphQLErrorCopyWith(GeneralGraphQLError value, $Res Function(GeneralGraphQLError) _then) = _$GeneralGraphQLErrorCopyWithImpl;
@useResult
$Res call({
 List<String>? messages
});




}
/// @nodoc
class _$GeneralGraphQLErrorCopyWithImpl<$Res>
    implements $GeneralGraphQLErrorCopyWith<$Res> {
  _$GeneralGraphQLErrorCopyWithImpl(this._self, this._then);

  final GeneralGraphQLError _self;
  final $Res Function(GeneralGraphQLError) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messages = freezed,}) {
  return _then(GeneralGraphQLError(
freezed == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

/// @nodoc


class NullValueError implements Failure {
  const NullValueError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NullValueError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.nullValueError()';
}


}




/// @nodoc


class NoResidenceError implements Failure {
  const NoResidenceError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NoResidenceError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.noResidenceError()';
}


}




/// @nodoc


class FailureException implements Failure {
  const FailureException(this.message);
  

 final  String? message;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FailureExceptionCopyWith<FailureException> get copyWith => _$FailureExceptionCopyWithImpl<FailureException>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FailureException&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'Failure.exception(message: $message)';
}


}

/// @nodoc
abstract mixin class $FailureExceptionCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory $FailureExceptionCopyWith(FailureException value, $Res Function(FailureException) _then) = _$FailureExceptionCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$FailureExceptionCopyWithImpl<$Res>
    implements $FailureExceptionCopyWith<$Res> {
  _$FailureExceptionCopyWithImpl(this._self, this._then);

  final FailureException _self;
  final $Res Function(FailureException) _then;

/// Create a copy of Failure
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(FailureException(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class AuthCancelledByUser implements Failure {
  const AuthCancelledByUser();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthCancelledByUser);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'Failure.authCancelledByUser()';
}


}




// dart format on
