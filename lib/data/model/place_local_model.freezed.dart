// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_local_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaceLocalModel {

 String get ref; String get name; String get country; String get type; String get imageUrl;
/// Create a copy of PlaceLocalModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaceLocalModelCopyWith<PlaceLocalModel> get copyWith => _$PlaceLocalModelCopyWithImpl<PlaceLocalModel>(this as PlaceLocalModel, _$identity);

  /// Serializes this PlaceLocalModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaceLocalModel&&(identical(other.ref, ref) || other.ref == ref)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ref,name,country,type,imageUrl);

@override
String toString() {
  return 'PlaceLocalModel(ref: $ref, name: $name, country: $country, type: $type, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class $PlaceLocalModelCopyWith<$Res>  {
  factory $PlaceLocalModelCopyWith(PlaceLocalModel value, $Res Function(PlaceLocalModel) _then) = _$PlaceLocalModelCopyWithImpl;
@useResult
$Res call({
 String ref, String name, String country, String type, String imageUrl
});




}
/// @nodoc
class _$PlaceLocalModelCopyWithImpl<$Res>
    implements $PlaceLocalModelCopyWith<$Res> {
  _$PlaceLocalModelCopyWithImpl(this._self, this._then);

  final PlaceLocalModel _self;
  final $Res Function(PlaceLocalModel) _then;

/// Create a copy of PlaceLocalModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ref = null,Object? name = null,Object? country = null,Object? type = null,Object? imageUrl = null,}) {
  return _then(_self.copyWith(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaceLocalModel].
extension PlaceLocalModelPatterns on PlaceLocalModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaceLocalModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaceLocalModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaceLocalModel value)  $default,){
final _that = this;
switch (_that) {
case _PlaceLocalModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaceLocalModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlaceLocalModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ref,  String name,  String country,  String type,  String imageUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaceLocalModel() when $default != null:
return $default(_that.ref,_that.name,_that.country,_that.type,_that.imageUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ref,  String name,  String country,  String type,  String imageUrl)  $default,) {final _that = this;
switch (_that) {
case _PlaceLocalModel():
return $default(_that.ref,_that.name,_that.country,_that.type,_that.imageUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ref,  String name,  String country,  String type,  String imageUrl)?  $default,) {final _that = this;
switch (_that) {
case _PlaceLocalModel() when $default != null:
return $default(_that.ref,_that.name,_that.country,_that.type,_that.imageUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaceLocalModel implements PlaceLocalModel {
  const _PlaceLocalModel({required this.ref, required this.name, required this.country, required this.type, required this.imageUrl});
  factory _PlaceLocalModel.fromJson(Map<String, dynamic> json) => _$PlaceLocalModelFromJson(json);

@override final  String ref;
@override final  String name;
@override final  String country;
@override final  String type;
@override final  String imageUrl;

/// Create a copy of PlaceLocalModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaceLocalModelCopyWith<_PlaceLocalModel> get copyWith => __$PlaceLocalModelCopyWithImpl<_PlaceLocalModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaceLocalModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaceLocalModel&&(identical(other.ref, ref) || other.ref == ref)&&(identical(other.name, name) || other.name == name)&&(identical(other.country, country) || other.country == country)&&(identical(other.type, type) || other.type == type)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ref,name,country,type,imageUrl);

@override
String toString() {
  return 'PlaceLocalModel(ref: $ref, name: $name, country: $country, type: $type, imageUrl: $imageUrl)';
}


}

/// @nodoc
abstract mixin class _$PlaceLocalModelCopyWith<$Res> implements $PlaceLocalModelCopyWith<$Res> {
  factory _$PlaceLocalModelCopyWith(_PlaceLocalModel value, $Res Function(_PlaceLocalModel) _then) = __$PlaceLocalModelCopyWithImpl;
@override @useResult
$Res call({
 String ref, String name, String country, String type, String imageUrl
});




}
/// @nodoc
class __$PlaceLocalModelCopyWithImpl<$Res>
    implements _$PlaceLocalModelCopyWith<$Res> {
  __$PlaceLocalModelCopyWithImpl(this._self, this._then);

  final _PlaceLocalModel _self;
  final $Res Function(_PlaceLocalModel) _then;

/// Create a copy of PlaceLocalModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ref = null,Object? name = null,Object? country = null,Object? type = null,Object? imageUrl = null,}) {
  return _then(_PlaceLocalModel(
ref: null == ref ? _self.ref : ref // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,country: null == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,imageUrl: null == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
