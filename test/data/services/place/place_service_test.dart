import 'package:flutter_challenge/data/exceptions/data_exceptions.dart';
import 'package:flutter_challenge/data/services/assets_service.dart';
import 'package:flutter_challenge/data/services/place/place_service.dart';
import 'package:flutter_challenge/domain/entity/place_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';
import 'package:result_dart/src/result_dart_base.dart';

import '../../../utils/mocks.dart';

void main() {
  late MockAssetsService mockAssetsService;
  late PlaceService placeService;

  group('places_service', () {
    setUpAll(() {
      mockAssetsService = MockAssetsService();
      placeService = PlaceService(mockAssetsService);
    });
    test(
      'Should continue passing the exception in fetchPlaces to next layers',
      () async {
        when(
          () => mockAssetsService.loadAsset(any()),
        ).thenAnswer((_) async => const Failure(AssetNotFoundException('')));

        final ResultDart<List<PlaceEntity>, Exception> res = await placeService
            .fetchPlaces();
        expect(res.isError(), true);
        expect(res.exceptionOrNull(), isA<AssetNotFoundException>());
      },
    );

    test(
      'Should pass FormatException when parsing json invalid json',
      () async {
        when(
          () => mockAssetsService.loadAsset(any()),
        ).thenAnswer((_) async => 'This is a false json'.toSuccess());

        final ResultDart<List<PlaceEntity>, Exception> res = await placeService
            .fetchPlaces();
        expect(res.isError(), true);
        expect(res.exceptionOrNull(), isA<FormatException>());
      },
    );
  });
}
