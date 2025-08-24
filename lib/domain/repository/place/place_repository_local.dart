import '../../../domain/model/place/place.dart';
import '../../../utils/result.dart';
import '../../datasources/assets_local_datasource.dart';
import '../../model/place/place_local_model.dart';
import 'place_repository.dart';

class PlaceRepositoryLocal implements PlaceRepository {
  PlaceRepositoryLocal({required AssetsLocalDatasource localDatasource})
    : _localDatasource = localDatasource;

  final AssetsLocalDatasource _localDatasource;

  List<Place>? _cachedPlaces;

  @override
  Future<Result<List<Place>>> getPlaces() async {
    if (_cachedPlaces != null) {
      return Result<List<Place>>.ok(_cachedPlaces!);
    }
    try {
      final Result<List<PlaceLocalModel>> result = await _localDatasource
          .getLocalPlaces();

      switch (result) {
        case Ok<List<PlaceLocalModel>>(:final List<PlaceLocalModel> value):
          _cachedPlaces = value
              .map(
                (PlaceLocalModel placeLocal) => Place(
                  type: placeLocal.type,
                  imageUrl: placeLocal.imageUrl,
                  title: placeLocal.title,
                ),
              )
              .toList();
          return Result<List<Place>>.ok(_cachedPlaces!);
        case Error<List<PlaceLocalModel>>(:final Exception error):
          return Result<List<Place>>.error(error);
      }
    } on Exception catch (e) {
      return Result<List<Place>>.error(e);
    }
  }
}
