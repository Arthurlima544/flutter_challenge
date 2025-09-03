import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/widgets/default_appbar.dart';
import '../../blocs/counter/counter_bloc.dart';
import 'widgets/large_list.dart';

class PerformanceScreen extends StatefulWidget {
  const PerformanceScreen({super.key});

  @override
  State<PerformanceScreen> createState() => _PerformanceScreenState();
}

class _PerformanceScreenState extends State<PerformanceScreen> {
  @override
  Widget build(BuildContext context) => BlocBuilder<CounterBloc, CounterState>(
    builder: (BuildContext context, CounterState state) => state.when(
      counter: (int counter) => Scaffold(
        appBar: const DefaultAppbar(titleText: 'Performance Page'),

        body: Column(
          children: <Widget>[
            Text(
              'Você apertou o botão $counter vezes',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const Divider(),
            const Expanded(child: RepaintBoundary(child: LargeList())),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(
              const CounterEvent.incrementValue(),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    ),
  );
}
