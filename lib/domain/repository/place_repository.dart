import 'package:result_dart/result_dart.dart';

import '../entity/place_entity.dart';

abstract class PlaceRepository {
  AsyncResult<List<PlaceEntity>> fetchPlaces();
}
