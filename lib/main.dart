import 'package:flutter/material.dart';

import 'widgets/home_page.dart';

void main() {
  runApp(const MyApp());
}

//stateless widget
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Cool Graph',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
