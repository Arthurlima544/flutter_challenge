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
        return const Failure(InvalidPlatformResultException('Data is null'));
      }
      return Success(res);
    } on MissingPluginException catch (e, s) {
      return Failure(
        NotImplementedPluginException(
          'Method $methodName not implemented in current platform: ${e.message}',
          s,
        ),
      );
    } catch (e, s) {
      //PlatformExceptions and others...
      return Failure(InvalidMethodException(e.toString(), s));
    }
  }
}
