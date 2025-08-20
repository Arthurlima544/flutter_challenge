// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Place _$PlaceFromJson(Map<String, dynamic> json) => _Place(
  type: json['type'] as String,
  imageUrl: json['imageUrl'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$PlaceToJson(_Place instance) => <String, dynamic>{
  'type': instance.type,
  'imageUrl': instance.imageUrl,
  'title': instance.title,
};
