import 'package:flutter/material.dart';

import '../widgets/home_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: const Text('Skill Playground'),
      backgroundColor: Colors.blue,
    ),
    body: GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: const <Widget>[
        HomeCard(title: 'CustomPainter Basics'),
        HomeCard(title: 'Navigator 2.0/ RouterDelegate'),
        HomeCard(title: 'Bloc State Management'),
        HomeCard(title: 'Platform Channels'),
        HomeCard(title: 'Performance & Repaints'),
        HomeCard(title: 'Async Isolates'),
        HomeCard(title: 'AnimationController Lifecycle'),
        HomeCard(title: 'StreamBuilder Error Handling'),
        HomeCard(title: 'Custom Slivers'),
      ],
    ),
  );
}
