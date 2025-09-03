import 'package:get_it/get_it.dart';

import 'data/repository/impl_device_info_repository.dart';
import 'data/repository/impl_place_repository.dart';
import 'data/services/assets_service.dart';
import 'data/services/device_info/device_info_service.dart';
import 'data/services/place/place_service.dart';
import 'data/services/platform_service.dart';
import 'domain/repository/device_info_repository.dart';
import 'domain/repository/place_repository.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<AssetsService>(AssetsService.new)
    ..registerLazySingleton<PlatformService>(PlatformService.new)
    ..registerLazySingleton<PlaceService>(
      () => PlaceService(getIt<AssetsService>()),
    )
    ..registerLazySingleton<DeviceInfoService>(
      () => DeviceInfoService(getIt<PlatformService>()),
    )
    ..registerLazySingleton<PlaceRepository>(
      () => ImplPlaceRepository(placeService: getIt<PlaceService>()),
    )
    ..registerLazySingleton<DeviceInfoRepository>(
      () => ImplDeviceInfoRepository(getIt<DeviceInfoService>()),
    );
}
