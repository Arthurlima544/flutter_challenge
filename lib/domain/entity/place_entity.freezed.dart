// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceEntity {

 String get type; String get imageUrl; String get title;
/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceEntityCopyWith<PlaceEntity> get copyWith => _$PlaceEntityCopyWithImpl<PlaceEntity>(this as PlaceEntity, _$identity);

  /// Serializes this PlaceEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,imageUrl,title);

@override
String toString() {
  return 'PlaceEntity(type: $type, imageUrl: $imageUrl, title: $title)';
}


}

/// @nodoc
abstract mixin class $PlaceEntityCopyWith<$Res>  {
  factory $PlaceEntityCopyWith(PlaceEntity value, $Res Function(PlaceEntity) _then) = _$PlaceEntityCopyWithImpl;
@useResult
$Res call({
 String type, String imageUrl, String title
});




}
/// @nodoc
class _$PlaceEntityCopyWithImpl<$Res>
    implements $PlaceEntityCopyWith<$Res> {
  _$PlaceEntityCopyWithImpl(this._self, this._then);

  final PlaceEntity _self;
  final $Res Function(PlaceEntity) _then;

/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? type = null,Object? imageUrl = null,Object? title = null,}) {
  return _then(_self.copyWith(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceEntity].
extension PlaceEntityPatterns on PlaceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceEntity value)  $default,){
final _that = this;
switch (_that) {
case _PlaceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String type,  String imageUrl,  String title)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
return $default(_that.type,_that.imageUrl,_that.title);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String type,  String imageUrl,  String title)  $default,) {final _that = this;
switch (_that) {
case _PlaceEntity():
return $default(_that.type,_that.imageUrl,_that.title);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String type,  String imageUrl,  String title)?  $default,) {final _that = this;
switch (_that) {
case _PlaceEntity() when $default != null:
return $default(_that.type,_that.imageUrl,_that.title);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceEntity implements PlaceEntity {
  const _PlaceEntity({required this.type, required this.imageUrl, required this.title});
  factory _PlaceEntity.fromJson(Map<String, dynamic> json) => _$PlaceEntityFromJson(json);

@override final  String type;
@override final  String imageUrl;
@override final  String title;

/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceEntityCopyWith<_PlaceEntity> get copyWith => __$PlaceEntityCopyWithImpl<_PlaceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceEntity&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.title, title) || other.title == title));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,type,imageUrl,title);

@override
String toString() {
  return 'PlaceEntity(type: $type, imageUrl: $imageUrl, title: $title)';
}


}

/// @nodoc
abstract mixin class _$PlaceEntityCopyWith<$Res> implements $PlaceEntityCopyWith<$Res> {
  factory _$PlaceEntityCopyWith(_PlaceEntity value, $Res Function(_PlaceEntity) _then) = __$PlaceEntityCopyWithImpl;
@override @useResult
$Res call({
 String type, String imageUrl, String title
});




}
/// @nodoc
class __$PlaceEntityCopyWithImpl<$Res>
    implements _$PlaceEntityCopyWith<$Res> {
  __$PlaceEntityCopyWithImpl(this._self, this._then);

  final _PlaceEntity _self;
  final $Res Function(_PlaceEntity) _then;

/// Create a copy of PlaceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? type = null,Object? imageUrl = null,Object? title = null,}) {
  return _then(_PlaceEntity(
type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
