import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/routes/skill_playground_router_delegate.dart';
import '../../../utils/widgets/default_appbar.dart';
import '../bloc/plataform_channels_bloc.dart';

class PlataformChannelsPage extends StatelessWidget {
  const PlataformChannelsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const DefaultAppbar(titleText: 'Plataform Channels Page'),
    body: Center(
      child: BlocBuilder<PlataformChannelsBloc, PlataformChannelsState>(
        builder: (BuildContext context, PlataformChannelsState state) =>
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
