import 'package:get_it/get_it.dart';

import 'data/datasources/local_datasource.dart';
import 'data/repository/place_repository.dart';
import 'data/repository/place_repository_local.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<LocalDatasource>(LocalDatasource.new)
    ..registerLazySingleton<PlaceRepository>(
      () =>
          PlaceRepositoryLocal(placeLocalDatasource: getIt<LocalDatasource>())
              as PlaceRepository,
    );
}
