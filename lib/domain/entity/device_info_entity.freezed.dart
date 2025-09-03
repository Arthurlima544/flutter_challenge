// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceInfoEntity {

 String get osVersion;
/// Create a copy of DeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceInfoEntityCopyWith<DeviceInfoEntity> get copyWith => _$DeviceInfoEntityCopyWithImpl<DeviceInfoEntity>(this as DeviceInfoEntity, _$identity);

  /// Serializes this DeviceInfoEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceInfoEntity&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,osVersion);

@override
String toString() {
  return 'DeviceInfoEntity(osVersion: $osVersion)';
}


}

/// @nodoc
abstract mixin class $DeviceInfoEntityCopyWith<$Res>  {
  factory $DeviceInfoEntityCopyWith(DeviceInfoEntity value, $Res Function(DeviceInfoEntity) _then) = _$DeviceInfoEntityCopyWithImpl;
@useResult
$Res call({
 String osVersion
});




}
/// @nodoc
class _$DeviceInfoEntityCopyWithImpl<$Res>
    implements $DeviceInfoEntityCopyWith<$Res> {
  _$DeviceInfoEntityCopyWithImpl(this._self, this._then);

  final DeviceInfoEntity _self;
  final $Res Function(DeviceInfoEntity) _then;

/// Create a copy of DeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? osVersion = null,}) {
  return _then(_self.copyWith(
osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceInfoEntity].
extension DeviceInfoEntityPatterns on DeviceInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoEntity():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String osVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceInfoEntity() when $default != null:
return $default(_that.osVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String osVersion)  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoEntity():
return $default(_that.osVersion);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String osVersion)?  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoEntity() when $default != null:
return $default(_that.osVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceInfoEntity implements DeviceInfoEntity {
  const _DeviceInfoEntity({required this.osVersion});
  factory _DeviceInfoEntity.fromJson(Map<String, dynamic> json) => _$DeviceInfoEntityFromJson(json);

@override final  String osVersion;

/// Create a copy of DeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceInfoEntityCopyWith<_DeviceInfoEntity> get copyWith => __$DeviceInfoEntityCopyWithImpl<_DeviceInfoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceInfoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceInfoEntity&&(identical(other.osVersion, osVersion) || other.osVersion == osVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,osVersion);

@override
String toString() {
  return 'DeviceInfoEntity(osVersion: $osVersion)';
}


}

/// @nodoc
abstract mixin class _$DeviceInfoEntityCopyWith<$Res> implements $DeviceInfoEntityCopyWith<$Res> {
  factory _$DeviceInfoEntityCopyWith(_DeviceInfoEntity value, $Res Function(_DeviceInfoEntity) _then) = __$DeviceInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 String osVersion
});




}
/// @nodoc
class __$DeviceInfoEntityCopyWithImpl<$Res>
    implements _$DeviceInfoEntityCopyWith<$Res> {
  __$DeviceInfoEntityCopyWithImpl(this._self, this._then);

  final _DeviceInfoEntity _self;
  final $Res Function(_DeviceInfoEntity) _then;

/// Create a copy of DeviceInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? osVersion = null,}) {
  return _then(_DeviceInfoEntity(
osVersion: null == osVersion ? _self.osVersion : osVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
