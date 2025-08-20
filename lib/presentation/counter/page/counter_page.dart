import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/routes/skill_playground_router_delegate.dart';
import '../bloc/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(
        onPressed: () {
          (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
              .goHome();
        },
      ),
    ),
    floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.end,

      children: <Widget>[
        FloatingActionButton(
          onPressed: () {
            context.read<CounterBloc>().add(
              const CounterEvent.incrementValue(),
            );
          },
          child: const Icon(Icons.add),
        ),
        const SizedBox(width: 16),
        FloatingActionButton(
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
