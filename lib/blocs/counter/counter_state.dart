part of 'counter_bloc.dart';

@freezed
sealed class CounterState with _$CounterState {
  const factory CounterState.counter({required int number}) = _Counter;
}
