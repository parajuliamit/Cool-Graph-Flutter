import 'package:cool_graph/pages/cool_graph.dart';
import 'package:cool_graph/pages/sand_falling.dart';
import 'package:flutter/material.dart';

import 'widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cool Graph',
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
      },
      initialRoute: "/",
    );
  }
}
