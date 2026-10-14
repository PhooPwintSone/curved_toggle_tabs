import 'package:flutter/material.dart';

class CurveTabPainter extends CustomPainter {
  /// 0.0 = First Tab Active, 1.0 = Second Tab Active
  final double progress;
  final Color color;
  final double tabHeight;
  final double radius;
  final double curveWidth;

  CurveTabPainter({
    required this.progress,
    required this.color,
    required this.tabHeight,
    required this.radius,
    required this.curveWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();
    final double halfWidth = size.width / 2;

    // Smoothly interpolate the left and right top edges between 0 and tabHeight
    final double leftY = progress * tabHeight;
    final double rightY = (1.0 - progress) * tabHeight;

    // 1. Top-left corner
    path.moveTo(0, leftY + radius);
    path.quadraticBezierTo(0, leftY, radius, leftY);
    path.lineTo(halfWidth - curveWidth, leftY);

    // 2. Center S-Curve (morphs smoothly as progress changes)
    path.cubicTo(
      halfWidth,
      leftY,
      halfWidth,
      rightY,
      halfWidth + curveWidth,
      rightY,
    );

    // 3. Top-right corner
    path.lineTo(size.width - radius, rightY);
    path.quadraticBezierTo(size.width, rightY, size.width, rightY + radius);

    // 4. Bottom-right corner
    path.lineTo(size.width, size.height - radius);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width - radius,
      size.height,
    );

    // 5. Bottom-left corner
    path.lineTo(radius, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height - radius);

    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CurveTabPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.color != color ||
        oldDelegate.tabHeight != tabHeight ||
        oldDelegate.radius != radius ||
        oldDelegate.curveWidth != curveWidth;
  }
}
