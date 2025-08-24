import 'package:flutter/material.dart';

import '../domain/model/place/place.dart';
import 'routes/skill_playground_router_delegate.dart';

dynamic mapOnTapByPlaceTitle(BuildContext context, Place place) {
  switch (place.title) {
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
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToRepaintBoundaryPage();
      };
    case 'Async Isolates':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToIsolatePage();
      };
    case 'Animation Controller Lifecycle':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToAnimationControllerPage(place.imageUrl);
      };
    case 'StreamBuilder Error Handling':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToStreamBuilderPage();
      };
    case 'Custom Slivers':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToSliversPage();
      };
    case 'Platform Channels':
      return () {
        (Router.of(context).routerDelegate as SkillPlaygroundRouterDelegate)
            .goToPlataformChannelsPage();
      };
    default:
      return () {};
  }
}
