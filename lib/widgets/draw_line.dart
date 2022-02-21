import 'package:flutter/material.dart';

import '../constants.dart';
import 'line_painter.dart';

class DrawLine extends StatelessWidget {
  const DrawLine(
    this.x, {
    required this.thickness,
    required this.numberOfLines,
    required this.color,
    Key? key,
  }) : super(key: key);
  final int x;
  final double thickness;
  final int numberOfLines;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: graphHeight - (x * (graphHeight / numberOfLines)),
      left: thickness,
      child: SizedBox(
        height: x * (graphHeight / numberOfLines),
        width: (numberOfLines - x + 1) * (graphHeight / numberOfLines),
        child: CustomPaint(
          painter: LinePainter(thickness: thickness, selectedColor: color),
        ),
      ),
    );
  }
}
