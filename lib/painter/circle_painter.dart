import 'package:flutter/material.dart';

class CirclePainter extends CustomPainter {

  final Offset offset;

  CirclePainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(this.offset, 30.0,
    Paint()
    ..color = Colors.greenAccent
    ..style = PaintingStyle.stroke);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
