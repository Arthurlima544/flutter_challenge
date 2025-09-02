import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/device_info/device_info.dart';
import '../../domain/repository/device_info/device_info_repository.dart';
import '../../utils/result.dart';

part 'platform_channels_bloc.freezed.dart';
part 'platform_channels_event.dart';
part 'platform_channels_state.dart';

class PlatformChannelsBloc
    extends Bloc<PlatformChannelsEvent, PlatformChannelsState> {
  PlatformChannelsBloc({required DeviceInfoRepository deviceInfoRepository})
    : _deviceInfoRepository = deviceInfoRepository,
      super(const _Initial()) {
    on<PlatformChannelsEvent>((
      PlatformChannelsEvent event,
      Emitter<PlatformChannelsState> emit,
    ) async {
      await event.map(
        getPlatformVersion: (_) async {
          emit(const PlatformChannelsState.loading());
          final Result<DeviceInfo> res = await _deviceInfoRepository
              .getPlatformVersion();

          switch (res) {
            case Ok<DeviceInfo>():
              emit(PlatformChannelsState.success(res.value.osversion));
            case Error<DeviceInfo>():
              emit(
                const PlatformChannelsState.error(
                  'Não foi possível obter a Versão desse dispositivo',
                ),
              );
          }
        },
      );
    });
  }
  final DeviceInfoRepository _deviceInfoRepository;
}
