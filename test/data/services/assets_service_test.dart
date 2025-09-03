import 'package:flutter_challenge/data/exceptions/data_exceptions.dart';
import 'package:flutter_challenge/data/services/assets_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/src/result_dart_base.dart';

void main() {
  test(
    'Ensure AssetsService is catching AssetNotFoundException when asset is not found',
    () async {
      final AssetsService assetsService = AssetsService();

      final ResultDart<String, Exception> res = await assetsService.loadAsset(
        'non-existent-file',
      );

      expect(res.isError(), true);
      expect(res.exceptionOrNull(), isA<AssetNotFoundException>());
    },
  );
}
