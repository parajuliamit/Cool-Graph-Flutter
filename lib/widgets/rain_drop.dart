import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/drop.dart';
import 'splash.dart';

class RainDrop extends StatelessWidget {
  const RainDrop(
    this.drop, {
    Key? key,
  }) : super(key: key);
  final Drop drop;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: drop.y,
      left: drop.x,
      child: Container(
        alignment: Alignment.center,
        width: 50,
        height: 50,
        child: drop.isSplatter
            ? const Splash()
            : Container(
                width: drop.thickness,
                height: drop.length,
                decoration: BoxDecoration(
                  color: kPurpleColor,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
      ),
    );
  }
}
