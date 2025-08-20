import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_local_model.freezed.dart';
part 'place_local_model.g.dart';

@freezed
abstract class PlaceLocalModel with _$PlaceLocalModel {
  const factory PlaceLocalModel({
    required String ref,
    required String name,
    required String country,
    required String type,
    required String imageUrl,
  }) = _PlaceLocalModel;

  factory PlaceLocalModel.fromJson(Map<String, Object?> json) =>
      _$PlaceLocalModelFromJson(json);
}
