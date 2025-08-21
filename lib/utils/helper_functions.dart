import 'package:flutter/material.dart';

import 'routes/skill_playground_router_delegate.dart';

GestureTapCallback? mapOnTapByPlaceTitle(BuildContext context, String title) {
  switch (title) {
    case 'CustomPainter Basics':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToCustomPainterPage();
      };
    case 'Navigator 2.0/ RouterDelegate':
      return () {};
    case 'Bloc State Management':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToBlocStateManagementPage();
      };
    case 'Performance & Repaints':
      return () {};
    case 'Async Isolates':
      return () {};
    case 'Animation Controller Lifecycle':
      return () {};
    case 'StreamBuilder Error Handling':
      return () {};
    case 'Custom Slivers':
      return () {};
    case 'Platform Channels':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToPlataformChannelsPage();
      };
    default:
      return () {};
  }
}
