import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info.freezed.dart';
part 'device_info.g.dart';

@freezed
sealed class DeviceInfo with _$DeviceInfo {
  const factory DeviceInfo({required String osversion}) = _DeviceInfo;

  factory DeviceInfo.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoFromJson(json);
}
