import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'draw_line.dart';

class QuadrantGraph extends StatelessWidget {
  const QuadrantGraph({
    required this.thickness,
    required this.numberOfLines,
    required this.color,
    Key? key,
  }) : super(key: key);

  final int thickness;
  final int numberOfLines;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    final color1 = Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    return SizedBox(
        width: graphHeight + thickness,
        height: graphHeight + thickness,
        child: Stack(
          children: [
            Container(
              height: graphHeight,
              width: thickness.toDouble(),
              color: color ?? color1,
            ),
            Positioned(
              top: graphHeight,
              child: Container(
                height: thickness.toDouble(),
                width: graphHeight + thickness,
                color: color ?? color1,
              ),
            ),
            ...List.generate(
                numberOfLines,
                (index) => DrawLine(
                      index + 1,
                      thickness: thickness.toDouble(),
                      numberOfLines: numberOfLines,
                      color: color,
                    ))
          ],
        ));
  }
}
