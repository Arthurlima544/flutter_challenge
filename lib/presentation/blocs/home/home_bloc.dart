import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/entity/place_entity.dart';
import '../../../domain/repository/place_repository.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required PlaceRepository placeRepository})
    : _placeRepository = placeRepository,
      super(const _Initial()) {
    on<HomeEvent>((HomeEvent event, Emitter<HomeState> emit) async {
      await event.map(
        load: (_) async {
          emit(const HomeState.loading());

          await _placeRepository.fetchPlaces().fold(
            (List<PlaceEntity> list) {
              emit(HomeState.success(list));
            },
            (Exception e) {
              emit(const HomeState.error('Não foi possível carregar a Home'));
            },
          );
        },
      );
    });
  }

  final PlaceRepository _placeRepository;
}
