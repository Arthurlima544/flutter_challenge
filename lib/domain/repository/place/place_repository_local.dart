import '../../../data/datasources/places_local_data_source.dart';
import '../../../data/model/place/place_local_model.dart';
import '../../../utils/result.dart';
import '../../model/place/place.dart';
import 'place_repository.dart';

class PlaceRepositoryLocal implements PlaceRepository {
  PlaceRepositoryLocal({required PlacesLocalDataSource localDatasource})
    : _localDatasource = localDatasource;

  final PlacesLocalDataSource _localDatasource;

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
