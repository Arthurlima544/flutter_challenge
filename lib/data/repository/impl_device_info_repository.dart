import 'package:result_dart/result_dart.dart';

import '../../domain/entity/device_info_entity.dart';
import '../../domain/repository/device_info_repository.dart';
import '../../utils/beautiful_logger.dart';
import '../exceptions/data_exceptions.dart';
import '../services/device_info/device_info_service.dart';

class ImplDeviceInfoRepository implements DeviceInfoRepository {
  ImplDeviceInfoRepository(this._deviceInfoService);
  final DeviceInfoService _deviceInfoService;

  DeviceInfoEntity? cachedDeviceInfo;
  @override
  AsyncResult<String> fetchPlatformVersion() async {
    if (cachedDeviceInfo != null) {
      return Success<String, Exception>(cachedDeviceInfo!.osVersion);
    }
    return _deviceInfoService
        .fetchOsVersion()
        .onFailure(_handleFetchPlatformVersionFailure)
        .map(_mapDeviceToString)
        .onSuccess((String newDeviceInfo) {
          cachedDeviceInfo = DeviceInfoEntity(osVersion: newDeviceInfo);
        });
  }

  void _handleFetchPlatformVersionFailure(Exception e) {
    if (e is NotImplementedPluginException) {
      logger.e('Plugin not found: $e');
    } else {
      logger.e('Unknown Exception: $e');
    }
  }

  String _mapDeviceToString(DeviceInfoEntity info) => info.osVersion;
}
