import 'dart:math';

import 'package:flutter/material.dart';

class CustomPaintingLogo extends StatefulWidget {
  const CustomPaintingLogo({super.key});
  @override
  State<CustomPaintingLogo> createState() => _CustomPaintingLogoState();
}

class _CustomPaintingLogoState extends State<CustomPaintingLogo>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 200,
    height: 200,

    child: AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? child) => CustomPaint(
        painter: LogoPainter(rotation: _controller.value * 2 * pi),
        child: child,
      ),
    ),
  );
}

class LogoPainter extends CustomPainter {
  LogoPainter({required this.rotation});
  final double rotation;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;

    canvas
      ..save()
      ..translate(centerX, centerY)
      ..rotate(rotation)
      ..translate(-centerX, -centerY);

    _drawLogo(canvas, size);

    canvas.restore();
  }

  void _drawLogo(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final Paint hexPaint = Paint()
      ..color = const Color(0XFFcfddf3).withValues(alpha: 0.8);
    final Paint bodyPaint = Paint()
      ..color = const Color(0xFF649ae7).withValues(alpha: 0.8);
    final Paint headPaint = Paint()
      ..color = const Color(0xFF3e84e2).withValues(alpha: 0.8);

    // Background
    Path hex = createHexagonPath(centerX: centerX, centerY: centerY, size: 50);
    canvas.drawPath(hex, hexPaint);

    // Body
    hex = createHexagonPath(centerX: centerX, centerY: centerY + 10, size: 25);
    canvas.drawPath(hex, bodyPaint);

    // Head
    hex = createHexagonPath(centerX: centerX, centerY: centerY - 20, size: 15);
    canvas.drawPath(hex, headPaint);
  }

  Path createHexagonPath({
    required double centerX,
    required double centerY,
    required double size,
  }) {
    final Path path = Path();
    const double initialRotation = pi / 2;

    for (int i = 0; i < 6; i++) {
      final double angle = (pi / 3 * i) + initialRotation;
      final double x = centerX + size * cos(angle);
      final double y = centerY + size * sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant LogoPainter oldDelegate) =>
      rotation != oldDelegate.rotation;
}
