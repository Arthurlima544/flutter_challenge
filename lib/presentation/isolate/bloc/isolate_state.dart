part of 'isolate_bloc.dart';

@freezed
abstract class IsolateState with _$IsolateState {
  const factory IsolateState.initial() = _Initial;
  const factory IsolateState.loading() = _Loading;
  const factory IsolateState.success({required bool isPrime}) = _Success;
}
