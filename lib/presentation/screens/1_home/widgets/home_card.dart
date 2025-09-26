import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entity/place_entity.dart';
import '../../../../utils/helper_functions.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({required this.place, super.key});
  final PlaceEntity place;

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTap: mapOnTapByPlaceTitle(context, place),
    child: Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: <Widget>[
          Semantics(
            label: 'Image of ${place.type}',
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                    place.imageUrl,
                    errorListener: (Object e) =>
                        const Icon(Icons.error_outline),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Center(
            child: Text(
              place.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class CornerOverlayPainter extends CustomPainter {
  CornerOverlayPainter({required this.color, required this.cornerRadius});
  final Color color;
  final double cornerRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = color;
    final double r = cornerRadius;

    // Top-left corner
    canvas.drawPath(
      Path()
        ..moveTo(0, r)
        ..lineTo(0, 0) // Explicitly draw to the corner
        ..lineTo(r, 0)
        ..arcToPoint(
          Offset(0, r),
          radius: Radius.circular(r),
          clockwise: false,
        ),
      paint,
    );

    // Top-right corner
    canvas.drawPath(
      Path()
        ..moveTo(size.width - r, 0)
        ..lineTo(size.width, 0) // Explicitly draw to the corner
        ..lineTo(size.width, r)
        ..arcToPoint(
          Offset(size.width - r, 0),
          radius: Radius.circular(r),
          clockwise: false,
        ),
      paint,
    );

    // Bottom-left corner
    canvas.drawPath(
      Path()
        ..moveTo(0, size.height - r)
        ..lineTo(0, size.height) // Explicitly draw to the corner
        ..lineTo(r, size.height)
        ..arcToPoint(
          Offset(0, size.height - r),
          radius: Radius.circular(r),
          clockwise: false,
        ),
      paint,
    );

    // Bottom-right corner
    canvas.drawPath(
      Path()
        ..moveTo(size.width, size.height - r)
        ..lineTo(size.width, size.height) // Explicitly draw to the corner
        ..lineTo(size.width - r, size.height)
        ..arcToPoint(
          Offset(size.width, size.height - r),
          radius: Radius.circular(r),
          clockwise: false,
        ),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
