import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';

import '../exceptions/data_exceptions.dart';

class AssetsService {
  AsyncResult<String> loadAsset(String path) async {
    try {
      return Success(await rootBundle.loadString(path));
    } catch (e, s) {
      return Failure(AssetNotFoundException('Asset not found: $path', s));
    }
  }
}
