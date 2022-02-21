import 'dart:math';

import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  late Paint painter;
  final double thickness;
  final Color? selectedColor;
  LinePainter({required this.thickness, required this.selectedColor}) {
    painter = Paint()
      ..color = selectedColor ??
          Color.fromRGBO(Random().nextInt(256), Random().nextInt(256),
              Random().nextInt(256), 1)
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawLine(Offset(-thickness, -thickness),
        Offset(size.width + thickness, size.height + thickness), painter);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
