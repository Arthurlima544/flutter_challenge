import 'dart:convert';

import 'package:flutter/services.dart';

import '../../utils/result.dart';
import '../model/place/place_local_model.dart';

class AssetsLocalDatasource {
  Future<Result<List<PlaceLocalModel>>> getLocalPlaces() async {
    final String jsonString = await rootBundle.loadString('assets/places.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return Result<List<PlaceLocalModel>>.ok(
      jsonList.map((dynamic json) => PlaceLocalModel.fromJson(json)).toList(),
    );
  }
}
