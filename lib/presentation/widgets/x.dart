import 'dart:math';

import 'package:flutter/material.dart';

import '../res/app_colors.dart';

class X extends StatelessWidget {
  final double? size;
  static double _size = 40;
  const X({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    _size = size ?? _size;
    return CustomPaint(painter: XPainter(size: _size));
  }
}

class XPainter extends CustomPainter {
  final double size;

  XPainter({super.repaint, required this.size});

  @override
  void paint(Canvas canvas, _) {
    final Paint paint = Paint()
      ..style = PaintingStyle.fill
      ..shader = const LinearGradient(
        stops: [0, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xFF84e4d6), AppColors.primaryColor],
      ).createShader(const Offset(10, -10) & Size(size, size));

    final double l = size;
    final Path path = Path();
    final double h = hypotenuse(l, l);

    // -4 + - +4 - +
    path
      ..moveTo(-h, -h / 2)
      ..lineTo(-h / 2, -h) // -
      ..lineTo(0, -h / 2) // -
      ..lineTo(h / 2, -h) // +
      ..lineTo(h, -h / 2) // -
      ..lineTo(h / 2, 0) // +
      ..lineTo(h, h / 2) // +
      ..lineTo(h / 2, h) // +
      ..lineTo(0, h / 2) // +
      ..lineTo(-h / 2, h) // -
      ..lineTo(-h, h / 2) // +
      ..lineTo(-h / 2, 0) // -
      ..lineTo(-h, -h / 2); // -

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  double hypotenuse(double x, double y) => sqrt(pow(x, 2) + pow(y, 2));
}
