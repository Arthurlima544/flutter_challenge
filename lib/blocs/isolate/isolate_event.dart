part of 'isolate_bloc.dart';

@freezed
sealed class IsolateEvent with _$IsolateEvent {
  const factory IsolateEvent.isPrime({
    required bool isWithCompute,
    required int number,
  }) = _IsPrime;
}
