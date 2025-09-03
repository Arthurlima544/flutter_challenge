import 'package:flutter_challenge/data/exceptions/data_exceptions.dart';
import 'package:flutter_challenge/data/services/device_info/device_info_service.dart';
import 'package:flutter_challenge/domain/entity/device_info_entity.dart';
import 'package:flutter_challenge/utils/consts.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../utils/mocks.dart';

void main() {
  late MockPlatformService mockPlatformService;
  late DeviceInfoService deviceInfoService;

  setUpAll(() {
    mockPlatformService = MockPlatformService();
    deviceInfoService = DeviceInfoService(mockPlatformService);
  });

  group('device_info_service', () {
    test(
      'Should continue passing a exception in PlatformService to next layers',
      () async {
        when(
          () => mockPlatformService.callPlatformMethod(
            platformMethodForFetchOSVersion,
          ),
        ).thenAnswer(
          (_) async => const Failure(InvalidMethodException('Error')),
        );

        final ResultDart<DeviceInfoEntity, Exception> res =
            await deviceInfoService.fetchOsVersion();
        expect(res.isError(), true);

        expect(res.exceptionOrNull(), isA<InvalidMethodException>());
      },
    );
  });
}
