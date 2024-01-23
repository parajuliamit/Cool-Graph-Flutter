import 'dart:math';

import 'package:flutter/material.dart';

import '../widgets/quadrant_graph.dart';
import '../widgets/thickness_button.dart';

List<Color?> colors = [
  Colors.red.shade700,
  Colors.green.shade700,
  Colors.blue.shade700,
  Colors.purple,
  Colors.white,
  null
];

class CoolGraph extends StatefulWidget {
  const CoolGraph({Key? key}) : super(key: key);

  @override
  State<CoolGraph> createState() => _CoolGraphState();
}

class _CoolGraphState extends State<CoolGraph> {
  int thickness = 1;
  int numberOfLines = 25;
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cool Graph"),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: FittedBox(
                child: Column(
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
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Column(
                children: [
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
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.white)),
                        child: Text(
                          "$thickness",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
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
                        style:
                            const TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
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
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
