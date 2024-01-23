import 'package:flutter/material.dart';

import 'pages/cool_graph.dart';
import 'pages/home_page.dart';
import 'pages/maze_generator.dart';
import 'pages/purple_rain.dart';
import 'pages/sand_falling.dart';
import 'pages/snake_game.dart';
import 'pages/sudoku_solver.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Projects',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        "/": (context) => const HomePage(),
        "/cool-graph": (context) => const CoolGraph(),
        "/sand-falling": (context) => const SandFalling(),
        "/purple-rain": (context) => const PurpleRain(),
        "/maze-generator": (context) => const MazeGenerator(),
        "/snake-game": (context) => const SnakeGame(),
        "/sudoku-solver": (context) => const SudokuSolver(),
      },
      initialRoute: "/",
    );
  }
}
