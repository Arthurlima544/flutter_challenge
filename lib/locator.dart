import 'package:get_it/get_it.dart';

import 'data/datasources/assets_local_datasource.dart';
import 'data/repository/place_repository.dart';
import 'data/repository/place_repository_local.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<AssetsLocalDatasource>(AssetsLocalDatasource.new)
    ..registerLazySingleton<PlaceRepository>(
      () =>
          PlaceRepositoryLocal(localDatasource: getIt<AssetsLocalDatasource>())
              as PlaceRepository,
    );
}
