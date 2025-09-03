import 'package:flutter/material.dart';

import '../domain/entity/place_entity.dart';
import 'routes/skill_playground_router_delegate.dart';

dynamic mapOnTapByPlaceTitle(BuildContext context, PlaceEntity place) {
  switch (place.title) {
    case 'CustomPainter Basics':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToCustomPainterScreen();
      };
    case 'Navigator 2.0/ RouterDelegate':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToNavigatorRouteScreen();
      };
    case 'Bloc State Management':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToBlocStateManagementScreen();
      };
    case 'Performance & Repaints':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToRepaintBoundaryScreen();
      };
    case 'Async Isolates':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToIsolateScreen();
      };
    case 'Animation Controller Lifecycle':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToAnimationControllerScreen(place.imageUrl);
      };
    case 'StreamBuilder Error Handling':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToStreamBuilderScreen();
      };
    case 'Custom Slivers':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToSliversScreen();
      };
    case 'Platform Channels':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToPlatformChannelsScreen();
      };
    default:
      return () {};
  }
}
