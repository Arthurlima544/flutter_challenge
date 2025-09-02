import '../../../utils/result.dart';
import '../../model/device_info/device_info.dart';

abstract class DeviceInfoRepository {
  Future<Result<DeviceInfo>> getPlatformVersion();
}
