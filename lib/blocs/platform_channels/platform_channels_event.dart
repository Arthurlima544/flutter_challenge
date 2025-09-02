part of 'platform_channels_bloc.dart';

@freezed
class PlatformChannelsEvent with _$PlatformChannelsEvent {
  const factory PlatformChannelsEvent.getPlatformVersion() =
      _GetPlatformVersion;
}
