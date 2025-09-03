import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info_entity.freezed.dart';
part 'device_info_entity.g.dart';

@freezed
sealed class DeviceInfoEntity with _$DeviceInfoEntity {
  const factory DeviceInfoEntity({required String osVersion}) =
      _DeviceInfoEntity;

  factory DeviceInfoEntity.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoEntityFromJson(json);
}
