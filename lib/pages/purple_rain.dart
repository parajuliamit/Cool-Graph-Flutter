import 'package:flutter/material.dart';

import '../widgets/purple_rain_body.dart';

class PurpleRain extends StatelessWidget {
  const PurpleRain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          PurpleRainBody(size),
          SafeArea(
            child: FloatingActionButton(
              foregroundColor: Colors.white,
              backgroundColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back),
            ),
          ),
        ],
      ),
    );
  }
}
