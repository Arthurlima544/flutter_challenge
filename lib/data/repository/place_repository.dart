import '../../domain/model/place/place.dart';
import '../../utils/result.dart';

abstract class PlaceRepository {
  Future<Result<List<Place>>> getPlaces();
}
