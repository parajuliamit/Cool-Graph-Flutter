import 'package:flutter/material.dart';

import '../widgets/sand_falling_body.dart';

class SandFalling extends StatelessWidget {
  const SandFalling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sand Falling"),
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        return SandFallingBody(
            size: Size(constraints.maxWidth, constraints.maxHeight));
      }),
    );
  }
}
