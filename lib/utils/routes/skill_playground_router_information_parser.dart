import 'package:flutter/material.dart';

import 'skill_playground_router_config.dart';

class SkillPlaygroundRouteInformationParser
    extends RouteInformationParser<SkillPlaygroundRouterConfig> {
  @override
  Future<SkillPlaygroundRouterConfig> parseRouteInformation(
    RouteInformation routeInformation,
  ) async => const SkillPlaygroundRouterConfig(selectedRoute: 'home');

  @override
  RouteInformation? restoreRouteInformation(
    SkillPlaygroundRouterConfig configuration,
  ) => RouteInformation(uri: Uri.parse(configuration.selectedRoute!));
}
