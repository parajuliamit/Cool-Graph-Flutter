import 'dart:async';

import 'package:flutter/material.dart';

import '../models/drop.dart';
import 'rain_drop.dart';

class PurpleRainBody extends StatefulWidget {
  const PurpleRainBody(this.size, {Key? key}) : super(key: key);
  final Size size;
  @override
  _PurpleRainBodyState createState() => _PurpleRainBodyState();
}

class _PurpleRainBodyState extends State<PurpleRainBody> {
  late final List<Drop> drops;
  late final Timer timer;
  @override
  void initState() {
    super.initState();
    drops = List.generate(
        300, (index) => Drop(widget.size.width, widget.size.height));
    timer = Timer.periodic(Duration(milliseconds: (1000 / 30).ceil()), (_) {
      fall();
    });
  }

  void fall() {
    for (Drop drop in drops) {
      drop.fall();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: List.generate(
      drops.length,
      (index) => RainDrop(drops[index]),
    ));
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
