import 'dart:math';

import 'package:flutter/material.dart';

import '../constants.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: List.generate(
          20,
          (index) => Positioned(
                left: Random().nextDouble() * 50,
                bottom: Random().nextDouble() * 50,
                child: Container(
                  width: Random().nextDouble() * 5,
                  height: Random().nextDouble() * 5,
                  decoration: BoxDecoration(
                    color:
                        kPurpleColor.withOpacity(Random().nextDouble() * 0.8),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )),
    );
  }
}
