import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Visualize"),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              child: const Text("Cool Graph"),
              onPressed: () {
                Navigator.pushNamed(context, "/cool-graph");
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text("Sand Falling"),
              onPressed: () {
                Navigator.pushNamed(context, "/sand-falling");
              },
            ),
          ]),
        ));
  }
}
