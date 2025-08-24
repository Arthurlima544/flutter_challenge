import '../../../domain/model/device_info/device_info.dart';
import '../../../utils/result.dart';

abstract class DeviceInfoRepository {
  Future<Result<DeviceInfo>> getPlataformVersion();
}
