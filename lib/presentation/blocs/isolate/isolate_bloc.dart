import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'isolate_bloc.freezed.dart';
part 'isolate_event.dart';
part 'isolate_state.dart';

class IsolateBloc extends Bloc<IsolateEvent, IsolateState> {
  IsolateBloc() : super(const _Initial()) {
    on<IsolateEvent>((IsolateEvent event, Emitter<IsolateState> emit) async {
      await event.map(
        isPrime: (_IsPrime e) async {
          emit(const IsolateState.loading());
          if (e.isWithCompute) {
            final bool isPrime = await isPrimeWithCompute(e.number);
            emit(IsolateState.success(isPrime: isPrime));
          } else {
            final bool isPrime = isPrimeWithoutCompute(e.number);
            emit(IsolateState.success(isPrime: isPrime));
          }
        },
      );
    });
  }
}

Future<bool> isPrimeWithCompute(int value) => compute(_calculate, value);
bool isPrimeWithoutCompute(int value) => _calculate(value);

bool _calculate(int value) {
  if (value == 1) {
    return false;
  }
  for (int i = 2; i < value; ++i) {
    if (value % i == 0) {
      return false;
    }
  }
  return true;
}
