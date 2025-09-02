import 'package:flutter/material.dart';

import '../../utils/routes/skill_playground_router_delegate.dart';

class SliversScreen extends StatelessWidget {
  const SliversScreen({super.key});

  @override
  Widget build(BuildContext context) => Material(
    child: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.cyanAccent,
          pinned: true,
          expandedHeight: 50.0,
          title: const Text('Custom Slivers Page'),
          leading: BackButton(
            onPressed: () {
              (Router.of(context).routerDelegate
                      as SkillPlaygroundRouterDelegate)
                  .goHome();
            },
          ),
        ),
        SliverFixedExtentList(
          delegate: SliverChildListDelegate(<Widget>[
            Container(
              color: Colors.red,
              child: const Center(
                child: Text(
                  'FixedExtentItem 1',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.green,
              child: const Center(
                child: Text(
                  'FixedExtentItem 2',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'FixedExtentItem 3',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ),
          ]),
          itemExtent: 25.0,
        ),

        SliverGrid(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => Container(
              color: Colors.deepPurpleAccent,
              child: Center(
                child: Text(
                  'SliverGrid ${index < 10 ? "\n" : ""}$index',
                  style: const TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            childCount: 25,
          ),

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
        ),

        SliverToBoxAdapter(
          child: Container(
            color: Colors.yellow,
            padding: const EdgeInsets.all(8),
            child: const Text('Grid Header', style: TextStyle(fontSize: 24)),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) => Container(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'ListItem $index',
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
            ),
            childCount: 10,
          ),
        ),
      ],
    ),
  );
}
