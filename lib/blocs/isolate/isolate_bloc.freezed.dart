// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'isolate_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$IsolateEvent implements DiagnosticableTreeMixin {

 bool get isWithCompute; int get number;
/// Create a copy of IsolateEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IsolateEventCopyWith<IsolateEvent> get copyWith => _$IsolateEventCopyWithImpl<IsolateEvent>(this as IsolateEvent, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IsolateEvent'))
    ..add(DiagnosticsProperty('isWithCompute', isWithCompute))..add(DiagnosticsProperty('number', number));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsolateEvent&&(identical(other.isWithCompute, isWithCompute) || other.isWithCompute == isWithCompute)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,isWithCompute,number);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IsolateEvent(isWithCompute: $isWithCompute, number: $number)';
}


}

/// @nodoc
abstract mixin class $IsolateEventCopyWith<$Res>  {
  factory $IsolateEventCopyWith(IsolateEvent value, $Res Function(IsolateEvent) _then) = _$IsolateEventCopyWithImpl;
@useResult
$Res call({
 bool isWithCompute, int number
});




}
/// @nodoc
class _$IsolateEventCopyWithImpl<$Res>
    implements $IsolateEventCopyWith<$Res> {
  _$IsolateEventCopyWithImpl(this._self, this._then);

  final IsolateEvent _self;
  final $Res Function(IsolateEvent) _then;

/// Create a copy of IsolateEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isWithCompute = null,Object? number = null,}) {
  return _then(_self.copyWith(
isWithCompute: null == isWithCompute ? _self.isWithCompute : isWithCompute // ignore: cast_nullable_to_non_nullable
as bool,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [IsolateEvent].
extension IsolateEventPatterns on IsolateEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IsPrime value)?  isPrime,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IsPrime() when isPrime != null:
return isPrime(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IsPrime value)  isPrime,}){
final _that = this;
switch (_that) {
case _IsPrime():
return isPrime(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IsPrime value)?  isPrime,}){
final _that = this;
switch (_that) {
case _IsPrime() when isPrime != null:
return isPrime(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( bool isWithCompute,  int number)?  isPrime,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IsPrime() when isPrime != null:
return isPrime(_that.isWithCompute,_that.number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( bool isWithCompute,  int number)  isPrime,}) {final _that = this;
switch (_that) {
case _IsPrime():
return isPrime(_that.isWithCompute,_that.number);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( bool isWithCompute,  int number)?  isPrime,}) {final _that = this;
switch (_that) {
case _IsPrime() when isPrime != null:
return isPrime(_that.isWithCompute,_that.number);case _:
  return null;

}
}

}

/// @nodoc


class _IsPrime with DiagnosticableTreeMixin implements IsolateEvent {
  const _IsPrime({required this.isWithCompute, required this.number});
  

@override final  bool isWithCompute;
@override final  int number;

/// Create a copy of IsolateEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IsPrimeCopyWith<_IsPrime> get copyWith => __$IsPrimeCopyWithImpl<_IsPrime>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IsolateEvent.isPrime'))
    ..add(DiagnosticsProperty('isWithCompute', isWithCompute))..add(DiagnosticsProperty('number', number));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IsPrime&&(identical(other.isWithCompute, isWithCompute) || other.isWithCompute == isWithCompute)&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,isWithCompute,number);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IsolateEvent.isPrime(isWithCompute: $isWithCompute, number: $number)';
}


}

/// @nodoc
abstract mixin class _$IsPrimeCopyWith<$Res> implements $IsolateEventCopyWith<$Res> {
  factory _$IsPrimeCopyWith(_IsPrime value, $Res Function(_IsPrime) _then) = __$IsPrimeCopyWithImpl;
@override @useResult
$Res call({
 bool isWithCompute, int number
});




}
/// @nodoc
class __$IsPrimeCopyWithImpl<$Res>
    implements _$IsPrimeCopyWith<$Res> {
  __$IsPrimeCopyWithImpl(this._self, this._then);

  final _IsPrime _self;
  final $Res Function(_IsPrime) _then;

/// Create a copy of IsolateEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isWithCompute = null,Object? number = null,}) {
  return _then(_IsPrime(
isWithCompute: null == isWithCompute ? _self.isWithCompute : isWithCompute // ignore: cast_nullable_to_non_nullable
as bool,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$IsolateState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IsolateState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IsolateState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IsolateState()';
}


}

/// @nodoc
class $IsolateStateCopyWith<$Res>  {
$IsolateStateCopyWith(IsolateState _, $Res Function(IsolateState) __);
}


/// Adds pattern-matching-related methods to [IsolateState].
extension IsolateStatePatterns on IsolateState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( _Loading value)?  loading,TResult Function( _Success value)?  success,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( _Loading value)  loading,required TResult Function( _Success value)  success,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case _Loading():
return loading(_that);case _Success():
return success(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( _Loading value)?  loading,TResult? Function( _Success value)?  success,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case _Loading() when loading != null:
return loading(_that);case _Success() when success != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( bool isPrime)?  success,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.isPrime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( bool isPrime)  success,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case _Loading():
return loading();case _Success():
return success(_that.isPrime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( bool isPrime)?  success,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case _Loading() when loading != null:
return loading();case _Success() when success != null:
return success(_that.isPrime);case _:
  return null;

}
}

}

/// @nodoc


class _Initial with DiagnosticableTreeMixin implements IsolateState {
  const _Initial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IsolateState.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IsolateState.initial()';
}


}




/// @nodoc


class _Loading with DiagnosticableTreeMixin implements IsolateState {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IsolateState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IsolateState.loading()';
}


}




/// @nodoc


class _Success with DiagnosticableTreeMixin implements IsolateState {
  const _Success({required this.isPrime});
  

 final  bool isPrime;

/// Create a copy of IsolateState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SuccessCopyWith<_Success> get copyWith => __$SuccessCopyWithImpl<_Success>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'IsolateState.success'))
    ..add(DiagnosticsProperty('isPrime', isPrime));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Success&&(identical(other.isPrime, isPrime) || other.isPrime == isPrime));
}


@override
int get hashCode => Object.hash(runtimeType,isPrime);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'IsolateState.success(isPrime: $isPrime)';
}


}

/// @nodoc
abstract mixin class _$SuccessCopyWith<$Res> implements $IsolateStateCopyWith<$Res> {
  factory _$SuccessCopyWith(_Success value, $Res Function(_Success) _then) = __$SuccessCopyWithImpl;
@useResult
$Res call({
 bool isPrime
});




}
/// @nodoc
class __$SuccessCopyWithImpl<$Res>
    implements _$SuccessCopyWith<$Res> {
  __$SuccessCopyWithImpl(this._self, this._then);

  final _Success _self;
  final $Res Function(_Success) _then;

/// Create a copy of IsolateState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? isPrime = null,}) {
  return _then(_Success(
isPrime: null == isPrime ? _self.isPrime : isPrime // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
