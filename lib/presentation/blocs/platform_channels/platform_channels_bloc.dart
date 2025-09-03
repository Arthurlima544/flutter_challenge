import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/repository/device_info_repository.dart';

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
          await _deviceInfoRepository.fetchPlatformVersion().fold(
            (String osVersion) {
              emit(PlatformChannelsState.success(osVersion));
            },
            (Exception e) {
              emit(
                const PlatformChannelsState.error(
                  'Não foi possível obter a Versão desse dispositivo',
                ),
              );
            },
          );
        },
      );
    });
  }
  final DeviceInfoRepository _deviceInfoRepository;
}
