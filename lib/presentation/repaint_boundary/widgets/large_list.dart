import 'dart:math';

import 'package:flutter/material.dart';

class LargeList extends StatelessWidget {
  const LargeList({super.key});

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: 1000,
    itemBuilder: (BuildContext context, int index) => ListItem(index: index),
  );
}

class ListItem extends StatelessWidget {
  ListItem({required this.index, super.key})
    : color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    color: color.withValues(alpha: 0.2),
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
    child: Text('Item número $index'),
  );
}
