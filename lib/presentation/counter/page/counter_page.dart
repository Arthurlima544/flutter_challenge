import 'package:flutter/material.dart';

import '../../../utils/routes/skill_playground_router_delegate.dart';

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
  );
}
