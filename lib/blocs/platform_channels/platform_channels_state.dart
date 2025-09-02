part of 'platform_channels_bloc.dart';

@freezed
class PlatformChannelsState with _$PlatformChannelsState {
  const factory PlatformChannelsState.initial() = _Initial;
  const factory PlatformChannelsState.loading() = _Loading;
  const factory PlatformChannelsState.error(String message) = _Error;
  const factory PlatformChannelsState.success(String osversion) = _Success;
}
