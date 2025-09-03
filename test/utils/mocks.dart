import 'package:flutter/services.dart';
import 'package:flutter_challenge/data/services/assets_service.dart';
import 'package:flutter_challenge/data/services/platform_service.dart';
import 'package:mocktail/mocktail.dart';

class MockMethodChannel extends Mock implements MethodChannel {}

class MockAssetsService extends Mock implements AssetsService {}

class MockPlatformService extends Mock implements PlatformService {}
