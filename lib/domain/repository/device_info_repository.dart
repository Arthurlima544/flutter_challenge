import 'package:result_dart/result_dart.dart';

abstract class DeviceInfoRepository {
  AsyncResult<String> fetchPlatformVersion();
}
