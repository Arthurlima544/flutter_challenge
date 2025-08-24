import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'locator.dart';
import 'utils/routes/skill_playground_router_delegate.dart';
import 'utils/routes/skill_playground_router_information_parser.dart';

void main() {
  setupLocator();
  // habilite para identificar rebuilds desnecessarios
  // debugRepaintRainbowEnabled = true;
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerDelegate: SkillPlaygroundRouterDelegate(),
    routeInformationParser: SkillPlaygroundRouteInformationParser(),
  );
}
