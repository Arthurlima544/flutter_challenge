import '../../utils/app_exception.dart';

class AssetNotFoundException extends AppException {
  const AssetNotFoundException(super.message, [super.stacktrace]);
}

class InvalidPlatformResultException extends AppException {
  const InvalidPlatformResultException(super.message, [super.stacktrace]);
}

class InvalidMethodException extends AppException {
  const InvalidMethodException(super.message, [super.stacktrace]);
}

class NotImplementedPluginException extends AppException {
  const NotImplementedPluginException(super.message, [super.stacktrace]);
}

class DeviceInfoUnknownError extends AppException {
  const DeviceInfoUnknownError(super.message, [super.stacktrace]);
}
