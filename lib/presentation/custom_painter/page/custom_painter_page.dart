import 'package:flutter/material.dart';

import '../../../utils/routes/skill_playground_router_delegate.dart';
import '../widgets/custom_painting_logo.dart';

class CustomPainterPage extends StatelessWidget {
  const CustomPainterPage({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      leading: BackButton(
        onPressed: () {
          (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
              .goHome();
        },
      ),
      title: Text(title),
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(70.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),

          alignment: Alignment.centerLeft,
          child: const Text(
            'Custom Painter é um widget que permite desenhar diretamente na tela usando a API de desenho do Flutter. Com ela podemos criar designs incriveis como por exemplo a logo da For People de uma forma inusitada.',
            style: TextStyle(fontSize: 12),
          ),
        ),
      ),
    ),
    body: const CustomPaintingLogo(),
  );
}
