import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Projects"),
        ),
        body: const Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(children: [
              Text(
                "Choose a project",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              NavigateButton(
                route: "/sand-falling",
                text: "Sand Falling",
              ),
              NavigateButton(
                route: "/maze-generator",
                text: "Maze Generator",
              ),
              NavigateButton(
                route: "/snake-game",
                text: "Snake Game",
              ),
              NavigateButton(
                route: "/sudoku-solver",
                text: "Sudoku Solver",
              ),
              NavigateButton(
                route: "/purple-rain",
                text: "Purple Rain",
              ),
              NavigateButton(
                route: "/cool-graph",
                text: "Cool Graph",
              ),
            ]),
          ),
        ));
  }
}

class NavigateButton extends StatelessWidget {
  const NavigateButton({super.key, required this.route, required this.text});

  final String route;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          constraints: const BoxConstraints(minWidth: 200),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.white,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
