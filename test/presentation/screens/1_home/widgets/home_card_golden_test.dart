import 'package:flutter/material.dart';
import 'package:flutter_challenge/domain/entity/place_entity.dart';
import 'package:flutter_challenge/presentation/screens/1_home/widgets/home_card.dart';
import 'package:flutter_challenge/presentation/screens/2_custom_painter/custom_painter_screen.dart';
import 'package:flutter_challenge/presentation/screens/2_custom_painter/widget/custom_painting_logo.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../utils.dart';

void main() {
  group('AdaptativeCardTextExample Golden Tests', () {
    for (final double currentDPR in commonDPRs) {
      devicesSizes.forEach((
        String currentDeviceName,
        List<Size> deviceSizeList,
      ) {
        for (final Size currentDeviceSize in deviceSizeList) {
          final String filename =
              'home_card_$currentDeviceName$currentDPR$currentDeviceSize';
          goldenTestAdaptiveCard(
            currentDeviceName,
            currentDPR,
            currentDeviceSize,
            filename,
          );
        }
      });
    }
  });
}

void goldenTestAdaptiveCard(
  String currentDeviceName,
  double currentDPR,
  Size currentDeviceSize,
  String filename,
) {
  testWidgets(
    '$currentDeviceName: Device Pixel Ratio $currentDPR : Device Size: $currentDeviceSize',
    (WidgetTester tester) async {
      final double devicePixelRatio = currentDPR;
      final Size physicalSize = currentDeviceSize;

      const PlaceEntity placeExample = PlaceEntity(
        title: 'Sample Place',
        type: 'Place Type',
        imageUrl:
            'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=60',
      );

      tester.view.devicePixelRatio = devicePixelRatio;
      tester.view.physicalSize = physicalSize;

      await tester.binding.setSurfaceSize(physicalSize);
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: Center(child: CustomPaintingLogo())),
        ),
      );

      await expectLater(
        find.byType(CustomPaintingLogo),
        matchesGoldenFile('../../../../goldens/$filename.png'),
      );
    },
  );
}
