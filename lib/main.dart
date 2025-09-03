import 'package:flutter/material.dart';
import 'locator.dart';
import 'utils/beautiful_logger.dart';
import 'utils/routes/skill_playground_router_delegate.dart';
import 'utils/routes/skill_playground_router_information_parser.dart';

void main() {
  setupLocator();
  // habilite para identificar rebuilds desnecessários
  // debugRepaintRainbowEnabled = true;
  logger.i('App Starting');
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
