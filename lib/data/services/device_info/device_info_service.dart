import 'package:result_dart/result_dart.dart';

import '../../../domain/entity/device_info_entity.dart';
import '../platform_service.dart';

class DeviceInfoService {
  DeviceInfoService(this._platformService);
  final PlatformService _platformService;

  AsyncResult<DeviceInfoEntity> fetchOsVersion() async {
    final ResultDart<String, Exception> result = await _platformService
        .callPlatformMethod('getOSVersion');

    return result.map(_mapResultToDeviceInfo);
  }

  DeviceInfoEntity _mapResultToDeviceInfo(String osVersion) =>
      DeviceInfoEntity(osVersion: osVersion);
}
