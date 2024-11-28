import 'package:flutter/material.dart';

class O extends StatelessWidget {
  final double? size;
  static double _size = 40;

  const O({super.key, this.size});

  @override
  Widget build(BuildContext context) {
    _size = size ?? _size;
    return CustomPaint(painter: OPainter(size: _size));
  }
}

class OPainter extends CustomPainter {
  final double size;

  OPainter({super.repaint, required this.size});

  @override
  void paint(Canvas canvas, _) {
    final Paint paint = Paint()
      ..strokeWidth = size
      ..style = PaintingStyle.stroke
      ..shader = const LinearGradient(
        stops: [0, 1],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Color(0xFFf1dd7a), Color(0xFFf77e37)],
      ).createShader(const Offset(10, -10) & Size(size, size));

    canvas.drawCircle(Offset.zero, size, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
