// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceEntity _$PlaceEntityFromJson(Map<String, dynamic> json) => _PlaceEntity(
  type: json['type'] as String,
  imageUrl: json['imageUrl'] as String,
  title: json['title'] as String,
);

Map<String, dynamic> _$PlaceEntityToJson(_PlaceEntity instance) =>
    <String, dynamic>{
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
    };
