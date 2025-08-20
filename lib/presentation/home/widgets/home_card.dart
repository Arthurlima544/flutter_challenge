import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Card(
    child: Stack(
      children: <Widget>[
        const Positioned.fill(child: FlutterLogo()),
        Center(child: Text(title, textAlign: TextAlign.center)),
      ],
    ),
  );
}
