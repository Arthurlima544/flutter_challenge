import 'package:flutter/material.dart';
import 'locator.dart';
import 'utils/routes/skill_playground_router_delegate.dart';
import 'utils/routes/skill_playground_router_information_parser.dart';

void main() {
  setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    routerDelegate: SkillPlaygroundRouterDelegate(),
    routeInformationParser: SkillPlaygroundRouteInformationParser(),
  );
}
