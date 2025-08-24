import '../../../utils/result.dart';
import '../../model/place/place.dart';

abstract class PlaceRepository {
  Future<Result<List<Place>>> getPlaces();
}
