import 'dart:math';

import 'package:flutter/material.dart';

import 'quadrant_graph.dart';
import 'thickness_button.dart';

List<Color?> colors = [
  Colors.red.shade700,
  Colors.green.shade700,
  Colors.blue.shade700,
  Colors.purple,
  Colors.white,
  null
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int thickness = 1;
  int numberOfLines = 25;
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Center(
              child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: -pi / 2,
                        child: QuadrantGraph(
                          thickness: thickness,
                          numberOfLines: numberOfLines,
                          color: colors[selectedColor],
                        ),
                      ),
                      QuadrantGraph(
                        thickness: thickness,
                        numberOfLines: numberOfLines,
                        color: colors[selectedColor],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.rotate(
                        angle: -pi,
                        child: QuadrantGraph(
                          thickness: thickness,
                          numberOfLines: numberOfLines,
                          color: colors[selectedColor],
                        ),
                      ),
                      Transform.rotate(
                        angle: pi / 2,
                        child: QuadrantGraph(
                          thickness: thickness,
                          numberOfLines: numberOfLines,
                          color: colors[selectedColor],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              //Thickness menu
              Row(
                children: [
                  const Text(
                    "Line Thickness :",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  ThicknessButton(
                    onPressed: () {
                      if (thickness > 1) {
                        setState(() {
                          thickness--;
                        });
                      }
                    },
                    icon: Icons.remove,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Colors.white)),
                    child: Text(
                      "$thickness",
                      style: const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  ThicknessButton(
                    onPressed: () {
                      setState(() {
                        if (thickness < 5) {
                          thickness++;
                        }
                      });
                    },
                    icon: Icons.add,
                  ),
                ],
              ),
              //Number of lines
              Row(
                children: [
                  const Text(
                    "No. of lines :",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Slider(
                    thumbColor: Colors.white,
                    activeColor: Colors.white,
                    inactiveColor: Colors.grey,
                    min: 0,
                    max: 50,
                    value: numberOfLines.toDouble(),
                    onChanged: (value) {
                      if (value.ceil() == numberOfLines) return;
                      setState(() {
                        numberOfLines = value.ceil();
                      });
                    },
                  ),
                  Text(
                    "$numberOfLines",
                    style: const TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              //Color menu
              Row(
                children: [
                  const Text(
                    "Choose Color :",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  ...List.generate(
                    colors.length,
                    (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedColor = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: colors[index] == null
                              ? Border.all(
                                  color: index == selectedColor
                                      ? Colors.green.shade700
                                      : Colors.white,
                                  width: 2)
                              : index == selectedColor
                                  ? Border.all(
                                      color: colors[index] == Colors.white
                                          ? Colors.green.shade700
                                          : Colors.white,
                                      width: 2)
                                  : null,
                          color: colors[index] ?? Colors.transparent,
                        ),
                        child: colors[index] == null
                            ? const Center(
                                child: Text(
                                  '?',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
