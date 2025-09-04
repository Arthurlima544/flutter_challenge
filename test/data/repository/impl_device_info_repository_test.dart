import 'package:flutter_challenge/data/exceptions/data_exceptions.dart';
import 'package:flutter_challenge/data/repository/impl_device_info_repository.dart';
import 'package:flutter_challenge/domain/entity/device_info_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../utils/mocks.dart';

void main() {
  late MockDeviceInfoService mockDeviceInfoService;
  late ImplDeviceInfoRepository deviceInfoRepository;

  setUpAll(() {
    mockDeviceInfoService = MockDeviceInfoService();
    deviceInfoRepository = ImplDeviceInfoRepository(mockDeviceInfoService);
  });

  group('device_info_repository', () {
    test('Should Stop execution when platform version not found', () async {
      when(() => mockDeviceInfoService.fetchOsVersion()).thenAnswer(
        (_) async => const Failure<DeviceInfoEntity, Exception>(
          NotImplementedPluginException(''),
        ),
      );

      final ResultDart<String, Exception> result = await deviceInfoRepository
          .fetchPlatformVersion();
      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<NotImplementedPluginException>());
    });

    test('Should cache platform version when found and reuse it', () async {
      when(() => mockDeviceInfoService.fetchOsVersion()).thenAnswer(
        (_) async => const Success<DeviceInfoEntity, Exception>(
          DeviceInfoEntity(osVersion: '17.5'),
        ),
      );

      final ResultDart<String, Exception> result = await deviceInfoRepository
          .fetchPlatformVersion();

      final DeviceInfoEntity? firstDeviceCached =
          deviceInfoRepository.cachedDeviceInfo;

      expect(result.isSuccess(), true);
      expect(result.getOrNull(), '17.5');
      expect(firstDeviceCached, isA<DeviceInfoEntity>());
      expect(firstDeviceCached?.osVersion, '17.5');

      await deviceInfoRepository.fetchPlatformVersion();

      final DeviceInfoEntity? reusedDeviceCached =
          deviceInfoRepository.cachedDeviceInfo;

      verify(() => mockDeviceInfoService.fetchOsVersion()).called(2);

      expect(reusedDeviceCached, equals(firstDeviceCached));
    });
  });
}
