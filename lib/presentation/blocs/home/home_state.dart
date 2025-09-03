part of 'home_bloc.dart';

@freezed
sealed class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.success(List<PlaceEntity> places) = _Success;
  const factory HomeState.error(String message) = _Error;
}
