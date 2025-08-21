// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_local_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceInfoLocalModel {

 String get version;
/// Create a copy of DeviceInfoLocalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceInfoLocalModelCopyWith<DeviceInfoLocalModel> get copyWith => _$DeviceInfoLocalModelCopyWithImpl<DeviceInfoLocalModel>(this as DeviceInfoLocalModel, _$identity);

  /// Serializes this DeviceInfoLocalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceInfoLocalModel&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'DeviceInfoLocalModel(version: $version)';
}


}

/// @nodoc
abstract mixin class $DeviceInfoLocalModelCopyWith<$Res>  {
  factory $DeviceInfoLocalModelCopyWith(DeviceInfoLocalModel value, $Res Function(DeviceInfoLocalModel) _then) = _$DeviceInfoLocalModelCopyWithImpl;
@useResult
$Res call({
 String version
});




}
/// @nodoc
class _$DeviceInfoLocalModelCopyWithImpl<$Res>
    implements $DeviceInfoLocalModelCopyWith<$Res> {
  _$DeviceInfoLocalModelCopyWithImpl(this._self, this._then);

  final DeviceInfoLocalModel _self;
  final $Res Function(DeviceInfoLocalModel) _then;

/// Create a copy of DeviceInfoLocalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceInfoLocalModel].
extension DeviceInfoLocalModelPatterns on DeviceInfoLocalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceInfoLocalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceInfoLocalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceInfoLocalModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoLocalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceInfoLocalModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoLocalModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String version)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceInfoLocalModel() when $default != null:
return $default(_that.version);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String version)  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoLocalModel():
return $default(_that.version);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String version)?  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoLocalModel() when $default != null:
return $default(_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceInfoLocalModel implements DeviceInfoLocalModel {
  const _DeviceInfoLocalModel({required this.version});
  factory _DeviceInfoLocalModel.fromJson(Map<String, dynamic> json) => _$DeviceInfoLocalModelFromJson(json);

@override final  String version;

/// Create a copy of DeviceInfoLocalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceInfoLocalModelCopyWith<_DeviceInfoLocalModel> get copyWith => __$DeviceInfoLocalModelCopyWithImpl<_DeviceInfoLocalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceInfoLocalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceInfoLocalModel&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'DeviceInfoLocalModel(version: $version)';
}


}

/// @nodoc
abstract mixin class _$DeviceInfoLocalModelCopyWith<$Res> implements $DeviceInfoLocalModelCopyWith<$Res> {
  factory _$DeviceInfoLocalModelCopyWith(_DeviceInfoLocalModel value, $Res Function(_DeviceInfoLocalModel) _then) = __$DeviceInfoLocalModelCopyWithImpl;
@override @useResult
$Res call({
 String version
});




}
/// @nodoc
class __$DeviceInfoLocalModelCopyWithImpl<$Res>
    implements _$DeviceInfoLocalModelCopyWith<$Res> {
  __$DeviceInfoLocalModelCopyWithImpl(this._self, this._then);

  final _DeviceInfoLocalModel _self;
  final $Res Function(_DeviceInfoLocalModel) _then;

/// Create a copy of DeviceInfoLocalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,}) {
  return _then(_DeviceInfoLocalModel(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
