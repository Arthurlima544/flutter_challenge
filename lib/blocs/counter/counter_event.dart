part of 'counter_bloc.dart';

@freezed
sealed class CounterEvent with _$CounterEvent {
  const factory CounterEvent.incrementValue() = _IncrementValue;
  const factory CounterEvent.decrementValue() = _DecrementValue;
}
