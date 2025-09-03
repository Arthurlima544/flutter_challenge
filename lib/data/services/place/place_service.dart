import 'dart:convert';

import 'package:result_dart/result_dart.dart';

import '../../../domain/entity/place_entity.dart';
import '../assets_service.dart';

class PlaceService {
  const PlaceService(this._assetsService);
  final AssetsService _assetsService;

  AsyncResult<List<PlaceEntity>> fetchPlaces() async {
    final ResultDart<String, Exception> result = await _assetsService.loadAsset(
      'assets/places.json',
    );

    return result.flatMap(_parsePlaces);
  }

  Result<List<PlaceEntity>> _parsePlaces(String jsonString) {
    try {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return Success(
        jsonList
            .map(
              (dynamic item) =>
                  PlaceEntity.fromJson(item as Map<String, dynamic>),
            )
            .toList(),
      );
    } on Exception catch (e) {
      return Failure(e);
    }
  }
}
