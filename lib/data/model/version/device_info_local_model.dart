import 'package:freezed_annotation/freezed_annotation.dart';

part 'device_info_local_model.freezed.dart';
part 'device_info_local_model.g.dart';

@freezed
abstract class DeviceInfoLocalModel with _$DeviceInfoLocalModel {
  const factory DeviceInfoLocalModel({required String version}) =
      _DeviceInfoLocalModel;

  factory DeviceInfoLocalModel.fromJson(Map<String, Object?> json) =>
      _$DeviceInfoLocalModelFromJson(json);
}
