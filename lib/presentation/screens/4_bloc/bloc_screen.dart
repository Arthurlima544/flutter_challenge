import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/widgets/default_appbar.dart';
import '../../blocs/counter/counter_bloc.dart';

class BlocScreen extends StatelessWidget {
  const BlocScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: const DefaultAppbar(titleText: 'Bloc State Management Page'),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: <Widget>[
        FloatingActionButton(
          heroTag: 'fab-add',
          onPressed: () {
            context.read<CounterBloc>().add(
              const CounterEvent.incrementValue(),
            );
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
          heroTag: 'fab-rem',
          onPressed: () {
            context.read<CounterBloc>().add(
              const CounterEvent.decrementValue(),
            );
          },
          child: const Icon(Icons.remove),
        ),
      ],
    ),
    body: BlocBuilder<CounterBloc, CounterState>(
      buildWhen: (CounterState previous, CounterState current) =>
          previous != current,
      builder: (BuildContext context, CounterState state) => state.when(
        counter: (int number) => Center(
          child: Text(number.toString(), style: const TextStyle(fontSize: 20)),
        ),
      ),
    ),
  );
}
