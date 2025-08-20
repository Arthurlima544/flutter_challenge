import 'package:flutter/material.dart';

import '../presentation/home/pages/custom_painter_page.dart';

GestureTapCallback? mapOnTapByPlaceTitle(BuildContext context, String title) {
  switch (title) {
    case 'CustomPainter Basics':
      return () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => CustomPainterPage(title: title),
          ),
        );
      };
    case 'Navigator 2.0/ RouterDelegate':
      return () {};
    case 'Bloc State Management':
      return () {};
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
      return () {};
    default:
      return () {};
  }
}
