import 'package:result_dart/result_dart.dart';

import '../../domain/entity/place_entity.dart';
import '../../domain/repository/place_repository.dart';
import '../../utils/beautiful_logger.dart';
import '../exceptions/data_exceptions.dart';
import '../services/place/place_service.dart';

class ImplPlaceRepository implements PlaceRepository {
  ImplPlaceRepository({required this.placeService});
  final PlaceService placeService;

  List<PlaceEntity>? _cachedPlaces;
  @override
  AsyncResult<List<PlaceEntity>> fetchPlaces() async {
    if (_cachedPlaces != null) {
      return Success(_cachedPlaces!);
    }
    return placeService
        .fetchPlaces() //
        .onFailure(_handleFetchPlacesFailures)
        .recover(_recoverFetchPlaces)
        .onSuccess((List<PlaceEntity> newList) {
          _cachedPlaces = newList;
        });
  }

  void _handleFetchPlacesFailures(Exception e) {
    if (e is AssetNotFoundException) {
      logger.e('Asset Not Found: ${e.toString()}');
      // Todo: deal properly
    } else if (e is FormatException || e is TypeError) {
      logger.e('Error While parsing json: ${e.toString()}');
      // Todo: deal properly
    }
  }

  /// Recover FetchPlaces errors by sending a empty list
  Result<List<PlaceEntity>> _recoverFetchPlaces(Exception e) =>
      const Success(<PlaceEntity>[]);
}
