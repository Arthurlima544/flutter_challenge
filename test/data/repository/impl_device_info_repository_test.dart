import 'package:flutter_challenge/data/exceptions/data_exceptions.dart';
import 'package:flutter_challenge/data/repository/impl_device_info_repository.dart';
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
        (_) async => const Failure(NotImplementedPluginException('')),
      );

      final ResultDart<String, Exception> result = await deviceInfoRepository
          .fetchPlatformVersion();
      expect(result.isError(), true);
      expect(result.exceptionOrNull(), isA<NotImplementedPluginException>());
    });
  });
}
