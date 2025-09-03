import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_entity.freezed.dart';
part 'place_entity.g.dart';

@freezed
sealed class PlaceEntity with _$PlaceEntity {
  const factory PlaceEntity({
    required String type,
    required String imageUrl,
    required String title,
  }) = _PlaceEntity;

  factory PlaceEntity.fromJson(Map<String, Object?> json) =>
      _$PlaceEntityFromJson(json);
}
