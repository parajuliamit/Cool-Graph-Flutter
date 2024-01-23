import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Projects"),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    child: const Text("Sand Falling"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/sand-falling");
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text("Maze Generator"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/maze-generator");
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text("Snake Game"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/snake-game");
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text("Sudoku Solver"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/sudoku-solver");
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text("Purple Rain"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/purple-rain");
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text("Cool Graph"),
                    onPressed: () {
                      Navigator.pushNamed(context, "/cool-graph");
                    },
                  ),
                ]),
          ),
        ));
  }
}
