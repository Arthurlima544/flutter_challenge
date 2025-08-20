// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'counter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CounterEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterEvent()';
}


}

/// @nodoc
class $CounterEventCopyWith<$Res>  {
$CounterEventCopyWith(CounterEvent _, $Res Function(CounterEvent) __);
}


/// Adds pattern-matching-related methods to [CounterEvent].
extension CounterEventPatterns on CounterEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _IncrementValue value)?  incrementValue,TResult Function( _DecrementValue value)?  decrementValue,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IncrementValue() when incrementValue != null:
return incrementValue(_that);case _DecrementValue() when decrementValue != null:
return decrementValue(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _IncrementValue value)  incrementValue,required TResult Function( _DecrementValue value)  decrementValue,}){
final _that = this;
switch (_that) {
case _IncrementValue():
return incrementValue(_that);case _DecrementValue():
return decrementValue(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _IncrementValue value)?  incrementValue,TResult? Function( _DecrementValue value)?  decrementValue,}){
final _that = this;
switch (_that) {
case _IncrementValue() when incrementValue != null:
return incrementValue(_that);case _DecrementValue() when decrementValue != null:
return decrementValue(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  incrementValue,TResult Function()?  decrementValue,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IncrementValue() when incrementValue != null:
return incrementValue();case _DecrementValue() when decrementValue != null:
return decrementValue();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  incrementValue,required TResult Function()  decrementValue,}) {final _that = this;
switch (_that) {
case _IncrementValue():
return incrementValue();case _DecrementValue():
return decrementValue();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  incrementValue,TResult? Function()?  decrementValue,}) {final _that = this;
switch (_that) {
case _IncrementValue() when incrementValue != null:
return incrementValue();case _DecrementValue() when decrementValue != null:
return decrementValue();case _:
  return null;

}
}

}

/// @nodoc


class _IncrementValue implements CounterEvent {
  const _IncrementValue();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IncrementValue);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterEvent.incrementValue()';
}


}




/// @nodoc


class _DecrementValue implements CounterEvent {
  const _DecrementValue();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DecrementValue);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CounterEvent.decrementValue()';
}


}




/// @nodoc
mixin _$CounterState {

 int get number;
/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CounterStateCopyWith<CounterState> get copyWith => _$CounterStateCopyWithImpl<CounterState>(this as CounterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CounterState&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'CounterState(number: $number)';
}


}

/// @nodoc
abstract mixin class $CounterStateCopyWith<$Res>  {
  factory $CounterStateCopyWith(CounterState value, $Res Function(CounterState) _then) = _$CounterStateCopyWithImpl;
@useResult
$Res call({
 int number
});




}
/// @nodoc
class _$CounterStateCopyWithImpl<$Res>
    implements $CounterStateCopyWith<$Res> {
  _$CounterStateCopyWithImpl(this._self, this._then);

  final CounterState _self;
  final $Res Function(CounterState) _then;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,}) {
  return _then(_self.copyWith(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CounterState].
extension CounterStatePatterns on CounterState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Counter value)?  counter,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Counter() when counter != null:
return counter(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Counter value)  counter,}){
final _that = this;
switch (_that) {
case _Counter():
return counter(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Counter value)?  counter,}){
final _that = this;
switch (_that) {
case _Counter() when counter != null:
return counter(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int number)?  counter,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Counter() when counter != null:
return counter(_that.number);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int number)  counter,}) {final _that = this;
switch (_that) {
case _Counter():
return counter(_that.number);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int number)?  counter,}) {final _that = this;
switch (_that) {
case _Counter() when counter != null:
return counter(_that.number);case _:
  return null;

}
}

}

/// @nodoc


class _Counter implements CounterState {
  const _Counter({required this.number});
  

@override final  int number;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CounterCopyWith<_Counter> get copyWith => __$CounterCopyWithImpl<_Counter>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Counter&&(identical(other.number, number) || other.number == number));
}


@override
int get hashCode => Object.hash(runtimeType,number);

@override
String toString() {
  return 'CounterState.counter(number: $number)';
}


}

/// @nodoc
abstract mixin class _$CounterCopyWith<$Res> implements $CounterStateCopyWith<$Res> {
  factory _$CounterCopyWith(_Counter value, $Res Function(_Counter) _then) = __$CounterCopyWithImpl;
@override @useResult
$Res call({
 int number
});




}
/// @nodoc
class __$CounterCopyWithImpl<$Res>
    implements _$CounterCopyWith<$Res> {
  __$CounterCopyWithImpl(this._self, this._then);

  final _Counter _self;
  final $Res Function(_Counter) _then;

/// Create a copy of CounterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,}) {
  return _then(_Counter(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
