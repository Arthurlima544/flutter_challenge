import 'package:flutter/services.dart';
import 'package:result_dart/result_dart.dart';

import '../exceptions/data_exceptions.dart';

class PlatformService {
  PlatformService(this._channel);
  final MethodChannel _channel;

  AsyncResult<String> callPlatformMethod(String methodName) async {
    try {
      final String? res = await _channel.invokeMethod<String>(methodName);

      if (res == null) {
        return const Failure<String, Exception>(
          InvalidPlatformResultException('Data is null'),
        );
      }
      return Success<String, Exception>(res);
    } on MissingPluginException catch (e, s) {
      return Failure<String, Exception>(
        NotImplementedPluginException(
          'Method $methodName not implemented in current platform: ${e.message}',
          s,
        ),
      );
    } on Exception catch (e, s) {
      //PlatformExceptions and others...
      return Failure<String, Exception>(
        InvalidMethodException(e.toString(), s),
      );
    }
  }
}
