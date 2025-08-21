part of 'plataform_channels_bloc.dart';

@freezed
class PlataformChannelsEvent with _$PlataformChannelsEvent {
  const factory PlataformChannelsEvent.getPlataformVersion() =
      _GetPlataformVersion;
}
