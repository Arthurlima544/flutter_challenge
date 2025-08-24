import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/model/device_info/device_info.dart';
import '../../../domain/repository/device_info/device_info_repository.dart';
import '../../../utils/result.dart';

part 'plataform_channels_bloc.freezed.dart';
part 'plataform_channels_event.dart';
part 'plataform_channels_state.dart';

class PlataformChannelsBloc
    extends Bloc<PlataformChannelsEvent, PlataformChannelsState> {
  PlataformChannelsBloc({required DeviceInfoRepository deviceInfoRepository})
    : _deviceInfoRepository = deviceInfoRepository,
      super(const _Initial()) {
    on<PlataformChannelsEvent>((
      PlataformChannelsEvent event,
      Emitter<PlataformChannelsState> emit,
    ) async {
      await event.map(
        getPlataformVersion: (_) async {
          emit(const PlataformChannelsState.loading());
          final Result<DeviceInfo> res = await _deviceInfoRepository
              .getPlataformVersion();

          switch (res) {
            case Ok<DeviceInfo>():
              emit(PlataformChannelsState.success(res.value.osversion));
            case Error<DeviceInfo>():
              emit(
                const PlataformChannelsState.error(
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
