import 'package:freezed_annotation/freezed_annotation.dart';

part 'place.freezed.dart';
part 'place.g.dart';

@freezed
abstract class Place with _$Place {
  const factory Place({required String type, required String imageUrl}) =
      _Place;

  factory Place.fromJson(Map<String, Object?> json) => _$PlaceFromJson(json);
}
