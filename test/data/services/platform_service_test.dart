import 'package:flutter/services.dart';
import 'package:flutter_challenge/data/exceptions/data_exceptions.dart';
import 'package:flutter_challenge/data/services/platform_service.dart';
import 'package:flutter_challenge/utils/consts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:result_dart/src/result_dart_base.dart';
import 'package:mocktail/mocktail.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

void main() {
  late MockMethodChannel mockMethodChannel;
  late PlatformService platformService;
  group('platform_service', () {
    setUpAll(() {
      mockMethodChannel = MockMethodChannel();
      platformService = PlatformService(mockMethodChannel);
    });
    test(
      'Should send a InvalidPlatformResultException when platform return null',
      () async {
        when(
          () => mockMethodChannel.invokeMethod<String>(any()),
        ).thenAnswer((_) async => null);

        final ResultDart<String, Exception> res = await platformService
            .callPlatformMethod(platformMethodForFetchOSVersion);

        expect(res.isError(), true);
        expect(res.exceptionOrNull(), isA<InvalidPlatformResultException>());
      },
    );

    test('Should send a InvalidMethodException on unknown exception', () async {
      when(
        () => mockMethodChannel.invokeMethod<String>(any()),
      ).thenThrow(Exception('Some type of exception'));

      final ResultDart<String, Exception> res = await platformService
          .callPlatformMethod(platformMethodForFetchOSVersion);

      expect(res.isError(), true);
      expect(res.exceptionOrNull(), isA<InvalidMethodException>());
    });

    test(
      'Should send a MissingPluginException on not implemented methods in current platform',
      () async {
        when(
          () => mockMethodChannel.invokeMethod<String>(any()),
        ).thenThrow(MissingPluginException());

        final ResultDart<String, Exception> res = await platformService
            .callPlatformMethod(platformMethodForFetchOSVersion);

        expect(res.isError(), true);
        expect(res.exceptionOrNull(), isA<NotImplementedPluginException>());
      },
    );
  });
}
