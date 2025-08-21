import 'package:flutter/services.dart';

import '../../../utils/result.dart';
import '../../model/version/device_info_local_model.dart';

class DeviceInfoLocalDatasource {
  static const MethodChannel _channel = MethodChannel(
    'samples.flutter.dev/info',
  );

  Future<Result<DeviceInfoLocalModel>> getPlataformVersion() async {
    final String? res = await _channel.invokeMethod<String>('getOSVersion');
    return Result<DeviceInfoLocalModel>.ok(DeviceInfoLocalModel(version: res!));
  }
}
