import '../../../data/datasources/platform_data_source.dart';
import '../../../data/model/version/device_info_local_model.dart';
import '../../../utils/result.dart';
import '../../model/device_info/device_info.dart';
import 'device_info_repository.dart';

class DeviceInfoLocalRepository implements DeviceInfoRepository {
  DeviceInfoLocalRepository({required PlatformDataSource localDatasource})
    : _localDatasource = localDatasource;
  final PlatformDataSource _localDatasource;
  @override
  Future<Result<DeviceInfo>> getPlatformVersion() async {
    try {
      final Result<DeviceInfoLocalModel> res = await _localDatasource
          .getPlatformVersion();

      switch (res) {
        case Ok<DeviceInfoLocalModel>():
          return Result<DeviceInfo>.ok(
            DeviceInfo(osversion: res.value.version),
          );
        case Error<DeviceInfoLocalModel>():
          return Result<DeviceInfo>.error(res.error);
      }
    } on Exception catch (e) {
      return Result<DeviceInfo>.error(e);
    }
  }
}
