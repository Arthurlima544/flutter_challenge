import '../../../data/datasources/device_info/device_info_local_datasource.dart';
import '../../../data/model/version/device_info_local_model.dart';
import '../../../utils/result.dart';
import '../../model/device_info/device_info.dart';
import 'device_info_repository.dart';

class DeviceInfoLocalRepository implements DeviceInfoRepository {
  DeviceInfoLocalRepository({
    required DeviceInfoLocalDatasource localDatasource,
  }) : _localDatasource = localDatasource;
  final DeviceInfoLocalDatasource _localDatasource;
  @override
  Future<Result<DeviceInfo>> getPlataformVersion() async {
    try {
      final Result<DeviceInfoLocalModel> res = await _localDatasource
          .getPlataformVersion();

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
