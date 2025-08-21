import 'package:freezed_annotation/freezed_annotation.dart';

part 'version_local_model.freezed.dart';
part 'version_local_model.g.dart';

@freezed
abstract class VersionLocalModel with _$VersionLocalModel {
  const factory VersionLocalModel({required String version}) =
      _VersionLocalModel;

  factory VersionLocalModel.fromJson(Map<String, Object?> json) =>
      _$VersionLocalModelFromJson(json);
}
