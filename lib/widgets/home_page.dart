import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';
import 'draw_line.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FittedBox(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(
                      angle: -pi / 2, child: const QuadrantGraph()),
                  const QuadrantGraph(),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Transform.rotate(angle: -pi, child: const QuadrantGraph()),
                  Transform.rotate(angle: pi / 2, child: const QuadrantGraph()),
                ],
              ),
            ],
          ),
        ),
      ))),
    );
  }
}

class QuadrantGraph extends StatelessWidget {
  const QuadrantGraph({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Color.fromRGBO(
        Random().nextInt(256), Random().nextInt(256), Random().nextInt(256), 1);
    return SizedBox(
        width: graphHeight + thickness,
        height: graphHeight + thickness,
        child: Stack(
          children: [
            Container(
              height: graphHeight,
              width: thickness / 2,
              color: color,
            ),
            Positioned(
              top: graphHeight,
              child: Container(
                height: thickness / 2,
                width: graphHeight + thickness / 2,
                color: color,
              ),
            ),
            ...List.generate(numberOfLines, (index) => DrawLine(index + 1))
          ],
        ));
  }
}
