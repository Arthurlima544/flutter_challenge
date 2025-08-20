import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../data/repository/place_repository.dart';
import '../../../domain/model/place/place.dart';
import '../../../utils/result.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PlaceRepository placeRepository})
    : _placeRepository = placeRepository,
      super(const _Initial()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) async {
      await event.map(
        load: (_) async {
          emit(const HomeState.loading());
          final Result<List<Place>> result = await _placeRepository.getPlaces();

          switch (result) {
            case Ok<List<Place>>(:final List<Place> value):
              emit(HomeState.success(value));
            case Error<List<Place>>():
              emit(const HomeState.error('Não foi possível carregar a Home'));
          }
        },
      );
    });
  }

  final PlaceRepository _placeRepository;
}
