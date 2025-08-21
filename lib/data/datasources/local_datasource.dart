import 'dart:convert';

import 'package:flutter/services.dart';

import '../../utils/result.dart';
import '../model/place/place_local_model.dart';
import '../model/version/version_local_model.dart';

class LocalDatasource {
  static const MethodChannel _channel = MethodChannel(
    'samples.flutter.dev/info',
  );
  Future<Result<List<PlaceLocalModel>>> getLocalPlaces() async {
    final String jsonString = await rootBundle.loadString('assets/places.json');
    final List<dynamic> jsonList = jsonDecode(jsonString);

    return Result<List<PlaceLocalModel>>.ok(
      jsonList.map((dynamic json) => PlaceLocalModel.fromJson(json)).toList(),
    );
  }

  Future<Result<VersionLocalModel>> getPlataformVersion() async {
    final String? res = await _channel.invokeMethod<String>('getOSVersion');
    return Result<VersionLocalModel>.ok(VersionLocalModel(version: res!));
  }
}
