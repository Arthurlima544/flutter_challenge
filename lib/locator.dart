import 'package:get_it/get_it.dart';

import 'data/datasources/local/place_local_datasource.dart';
import 'data/repository/place_repository.dart';
import 'data/repository/place_repository_local.dart';

final GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt
    ..registerLazySingleton<PlaceLocalDatasource>(PlaceLocalDatasource.new)
    ..registerLazySingleton<PlaceRepository>(
      () =>
          PlaceRepositoryLocal(
                placeLocalDatasource: getIt<PlaceLocalDatasource>(),
              )
              as PlaceRepository,
    );
}
