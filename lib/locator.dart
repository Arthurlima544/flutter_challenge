import 'package:get_it/get_it.dart';

import 'data/datasources/places_local_data_source.dart';
import 'data/datasources/platform_data_source.dart';
import 'domain/repository/device_info/device_info_local_repository.dart';
import 'domain/repository/device_info/device_info_repository.dart';
import 'domain/repository/place/place_repository.dart';
import 'domain/repository/place/place_repository_local.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<PlacesLocalDataSource>(PlacesLocalDataSource.new)
    ..registerLazySingleton<PlatformDataSource>(PlatformDataSource.new)
    ..registerLazySingleton<PlaceRepository>(
      () =>
          PlaceRepositoryLocal(localDatasource: getIt<PlacesLocalDataSource>())
              as PlaceRepository,
    )
    ..registerLazySingleton<DeviceInfoRepository>(
      () =>
          DeviceInfoLocalRepository(
                localDatasource: getIt<PlatformDataSource>(),
              )
              as DeviceInfoRepository,
    );
}
