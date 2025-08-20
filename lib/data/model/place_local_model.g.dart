// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_local_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceLocalModel _$PlaceLocalModelFromJson(Map<String, dynamic> json) =>
    _PlaceLocalModel(
      ref: json['ref'] as String,
      name: json['name'] as String,
      country: json['country'] as String,
      type: json['type'] as String,
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$PlaceLocalModelToJson(_PlaceLocalModel instance) =>
    <String, dynamic>{
      'ref': instance.ref,
      'name': instance.name,
      'country': instance.country,
      'type': instance.type,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
    };
