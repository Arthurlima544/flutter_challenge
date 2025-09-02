import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/platform_channels/platform_channels_bloc.dart';
import '../../../utils/widgets/default_appbar.dart';

class PlatformChannelsScreen extends StatelessWidget {
  const PlatformChannelsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const DefaultAppbar(titleText: 'Platform Channels Page'),
    body: Center(
      child: BlocBuilder<PlatformChannelsBloc, PlatformChannelsState>(
        builder: (BuildContext context, PlatformChannelsState state) =>
            state.when(
              error: Text.new,
              initial: () => const Text('Inicializando...'),
              loading: CircularProgressIndicator.new,
              success: Text.new,
            ),
      ),
    ),
  );
}
