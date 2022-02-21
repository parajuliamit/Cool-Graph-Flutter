import 'dart:math';

import 'package:cool_graph/constants.dart';
import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  late Paint painter;

  LinePainter() {
    painter = Paint()
      ..color = Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
          Random().nextInt(256), 1)
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(
        const Offset(0, 0), Offset(size.width, size.height), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
