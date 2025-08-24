import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/routes/skill_playground_router_delegate.dart';
import '../../counter/bloc/counter_bloc.dart';
import '../widgets/large_list.dart';

class RepaintBoundaryPage extends StatefulWidget {
  const RepaintBoundaryPage({super.key});

  @override
  State<RepaintBoundaryPage> createState() => _RepaintBoundaryPageState();
}

class _RepaintBoundaryPageState extends State<RepaintBoundaryPage> {
  @override
  Widget build(BuildContext context) => BlocBuilder<CounterBloc, CounterState>(
    builder: (BuildContext context, CounterState state) => state.when(
      counter: (int counter) => Scaffold(
        appBar: AppBar(
          title: const Text('Repaint Boundary Page'),
          leading: BackButton(
            onPressed: () {
              (Router.of(context).routerDelegate
                      as SkillPlaygroundRouterDelegate)
                  .goHome();
            },
          ),
        ),
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
