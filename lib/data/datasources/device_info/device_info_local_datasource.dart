import 'package:flutter/services.dart';

import '../../../utils/result.dart';
import '../../model/version/version_local_model.dart';

class DeviceInfoLocalDatasource {
  static const MethodChannel _channel = MethodChannel(
    'samples.flutter.dev/info',
  );

  Future<Result<VersionLocalModel>> getPlataformVersion() async {
    final String? res = await _channel.invokeMethod<String>('getOSVersion');
    return Result<VersionLocalModel>.ok(VersionLocalModel(version: res!));
  }
}
