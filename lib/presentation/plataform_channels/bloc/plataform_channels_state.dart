part of 'plataform_channels_bloc.dart';

@freezed
class PlataformChannelsState with _$PlataformChannelsState {
  const factory PlataformChannelsState.initial() = _Initial;
  const factory PlataformChannelsState.loading() = _Loading;
  const factory PlataformChannelsState.error(String message) = _Error;
  const factory PlataformChannelsState.success(String osversion) = _Success;
}
