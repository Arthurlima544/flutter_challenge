import 'package:get_it/get_it.dart';

import 'data/datasources/assets_local_datasource.dart';
import 'data/datasources/device_info/device_info_local_datasource.dart';
import 'domain/repository/device_info/device_info_local_repository.dart';
import 'domain/repository/device_info/device_info_repository.dart';
import 'domain/repository/place/place_repository.dart';
import 'domain/repository/place/place_repository_local.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<AssetsLocalDatasource>(AssetsLocalDatasource.new)
    ..registerLazySingleton<DeviceInfoLocalDatasource>(
      DeviceInfoLocalDatasource.new,
    )
    ..registerLazySingleton<PlaceRepository>(
      () =>
          PlaceRepositoryLocal(localDatasource: getIt<AssetsLocalDatasource>())
              as PlaceRepository,
    )
    ..registerLazySingleton<DeviceInfoRepository>(
      () =>
          DeviceInfoLocalRepository(
                localDatasource: getIt<DeviceInfoLocalDatasource>(),
              )
              as DeviceInfoRepository,
    );
}
