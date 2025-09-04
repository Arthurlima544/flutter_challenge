// ignore_for_file: avoid_catches_without_on_clauses
// Need to catch error from rootBundle to ensure my user is informed when asset is not found
import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';

import '../exceptions/data_exceptions.dart';

class AssetsService {
  AsyncResult<String> loadAsset(String path) async {
    try {
      return Success<String, Exception>(await rootBundle.loadString(path));
    } catch (e, s) {
      return Failure<String, Exception>(
        AssetNotFoundException('Asset not found: $path', s),
      );
    }
  }
}
