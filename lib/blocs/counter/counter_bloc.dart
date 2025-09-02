import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const _Counter(number: 0)) {
    on<CounterEvent>((CounterEvent event, Emitter<CounterState> emit) {
      event.map(
        incrementValue: (_) {
          emit(state.copyWith(number: state.number + 1));
        },
        decrementValue: (_) {
          emit(state.copyWith(number: state.number - 1));
        },
      );
    });
  }
}
