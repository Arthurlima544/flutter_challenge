// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plataform_channels_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlataformChannelsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlataformChannelsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlataformChannelsEvent()';
}


}

/// @nodoc
class $PlataformChannelsEventCopyWith<$Res>  {
$PlataformChannelsEventCopyWith(PlataformChannelsEvent _, $Res Function(PlataformChannelsEvent) __);
}


/// Adds pattern-matching-related methods to [PlataformChannelsEvent].
extension PlataformChannelsEventPatterns on PlataformChannelsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetPlataformVersion value)?  getPlataformVersion,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPlataformVersion() when getPlataformVersion != null:
return getPlataformVersion(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetPlataformVersion value)  getPlataformVersion,}){
final _that = this;
switch (_that) {
case _GetPlataformVersion():
return getPlataformVersion(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetPlataformVersion value)?  getPlataformVersion,}){
final _that = this;
switch (_that) {
case _GetPlataformVersion() when getPlataformVersion != null:
return getPlataformVersion(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getPlataformVersion,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPlataformVersion() when getPlataformVersion != null:
return getPlataformVersion();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getPlataformVersion,}) {final _that = this;
switch (_that) {
case _GetPlataformVersion():
return getPlataformVersion();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getPlataformVersion,}) {final _that = this;
switch (_that) {
case _GetPlataformVersion() when getPlataformVersion != null:
return getPlataformVersion();case _:
  return null;

}
}

}

/// @nodoc


class _GetPlataformVersion implements PlataformChannelsEvent {
  const _GetPlataformVersion();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPlataformVersion);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlataformChannelsEvent.getPlataformVersion()';
}


}




/// @nodoc
mixin _$PlataformChannelsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlataformChannelsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlataformChannelsState()';
}


}

/// @nodoc
class $PlataformChannelsStateCopyWith<$Res>  {
$PlataformChannelsStateCopyWith(PlataformChannelsState _, $Res Function(PlataformChannelsState) __);
}


/// Adds pattern-matching-related methods to [PlataformChannelsState].
extension PlataformChannelsStatePatterns on PlataformChannelsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Error value)?  error,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Error value)  error,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Error():
return error(_that);case _Success():
return success(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Error value)?  error,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Error() when error != null:
return error(_that);case _Success() when success != null:
return success(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( String message)?  error,TResult Function( String osversion)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Success() when success != null:
return success(_that.osversion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( String message)  error,required TResult Function( String osversion)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Error():
return error(_that.message);case _Success():
return success(_that.osversion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( String message)?  error,TResult? Function( String osversion)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Error() when error != null:
return error(_that.message);case _Success() when success != null:
return success(_that.osversion);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements PlataformChannelsState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlataformChannelsState.initial()';
}


}




/// @nodoc


class _Loading implements PlataformChannelsState {
  const _Loading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlataformChannelsState.loading()';
}


}




/// @nodoc


class _Error implements PlataformChannelsState {
  const _Error(this.message);
  

 final  String message;

/// Create a copy of PlataformChannelsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<_Error> get copyWith => __$ErrorCopyWithImpl<_Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'PlataformChannelsState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res> implements $PlataformChannelsStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

/// Create a copy of PlataformChannelsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(_Error(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Success implements PlataformChannelsState {
  const _Success(this.osversion);
  

 final  String osversion;

/// Create a copy of PlataformChannelsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.osversion, osversion) || other.osversion == osversion));
}


@override
int get hashCode => Object.hash(runtimeType,osversion);

@override
String toString() {
  return 'PlataformChannelsState.success(osversion: $osversion)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $PlataformChannelsStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 String osversion
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of PlataformChannelsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? osversion = null,}) {
  return _then(_Success(
null == osversion ? _self.osversion : osversion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
