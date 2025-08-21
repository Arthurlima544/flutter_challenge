// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_local_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VersionLocalModel {

 String get version;
/// Create a copy of VersionLocalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VersionLocalModelCopyWith<VersionLocalModel> get copyWith => _$VersionLocalModelCopyWithImpl<VersionLocalModel>(this as VersionLocalModel, _$identity);

  /// Serializes this VersionLocalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VersionLocalModel&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'VersionLocalModel(version: $version)';
}


}

/// @nodoc
abstract mixin class $VersionLocalModelCopyWith<$Res>  {
  factory $VersionLocalModelCopyWith(VersionLocalModel value, $Res Function(VersionLocalModel) _then) = _$VersionLocalModelCopyWithImpl;
@useResult
$Res call({
 String version
});




}
/// @nodoc
class _$VersionLocalModelCopyWithImpl<$Res>
    implements $VersionLocalModelCopyWith<$Res> {
  _$VersionLocalModelCopyWithImpl(this._self, this._then);

  final VersionLocalModel _self;
  final $Res Function(VersionLocalModel) _then;

/// Create a copy of VersionLocalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? version = null,}) {
  return _then(_self.copyWith(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [VersionLocalModel].
extension VersionLocalModelPatterns on VersionLocalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VersionLocalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VersionLocalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VersionLocalModel value)  $default,){
final _that = this;
switch (_that) {
case _VersionLocalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VersionLocalModel value)?  $default,){
final _that = this;
switch (_that) {
case _VersionLocalModel() when $default != null:
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
case _VersionLocalModel() when $default != null:
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
case _VersionLocalModel():
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
case _VersionLocalModel() when $default != null:
return $default(_that.version);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VersionLocalModel implements VersionLocalModel {
  const _VersionLocalModel({required this.version});
  factory _VersionLocalModel.fromJson(Map<String, dynamic> json) => _$VersionLocalModelFromJson(json);

@override final  String version;

/// Create a copy of VersionLocalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VersionLocalModelCopyWith<_VersionLocalModel> get copyWith => __$VersionLocalModelCopyWithImpl<_VersionLocalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VersionLocalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VersionLocalModel&&(identical(other.version, version) || other.version == version));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,version);

@override
String toString() {
  return 'VersionLocalModel(version: $version)';
}


}

/// @nodoc
abstract mixin class _$VersionLocalModelCopyWith<$Res> implements $VersionLocalModelCopyWith<$Res> {
  factory _$VersionLocalModelCopyWith(_VersionLocalModel value, $Res Function(_VersionLocalModel) _then) = __$VersionLocalModelCopyWithImpl;
@override @useResult
$Res call({
 String version
});




}
/// @nodoc
class __$VersionLocalModelCopyWithImpl<$Res>
    implements _$VersionLocalModelCopyWith<$Res> {
  __$VersionLocalModelCopyWithImpl(this._self, this._then);

  final _VersionLocalModel _self;
  final $Res Function(_VersionLocalModel) _then;

/// Create a copy of VersionLocalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? version = null,}) {
  return _then(_VersionLocalModel(
version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
