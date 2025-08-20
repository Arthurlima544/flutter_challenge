import '../../domain/model/place/place.dart';
import '../../utils/result.dart';
import '../datasources/local/place_local_datasource.dart';
import '../model/place_local_model.dart';
import 'place_repository.dart';

class PlaceRepositoryLocal implements PlaceRepository {
  PlaceRepositoryLocal({required PlaceLocalDatasource placeLocalDatasource})
    : _placeLocalDatasource = placeLocalDatasource;

  final PlaceLocalDatasource _placeLocalDatasource;

  List<Place>? _cachedPlaces;

  @override
  Future<Result<List<Place>>> getPlaces() async {
    if (_cachedPlaces != null) {
      return Result<List<Place>>.ok(_cachedPlaces!);
    }
    try {
      final Result<List<PlaceLocalModel>> result = await _placeLocalDatasource
          .getLocalPlaces();

      switch (result) {
        case Ok<List<PlaceLocalModel>>(:final List<PlaceLocalModel> value):
          _cachedPlaces = value
              .map(
                (PlaceLocalModel placeLocal) =>
                    Place(type: placeLocal.type, imageUrl: placeLocal.imageUrl),
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
