import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const width = 500;
const height = 500;
const size = 20;

class SnakeGame extends StatefulWidget {
  const SnakeGame({Key? key}) : super(key: key);

  @override
  State<SnakeGame> createState() => _SnakeGameState();
}

class _SnakeGameState extends State<SnakeGame> {
  int x = 0;
  int y = 0;
  int xVel = 1;
  int yVel = 0;
  bool isCompleted = false;
  late final Timer timer;
  late int foodX;
  late int foodY;
  int length = 1;
  List<int> snakeX = [0];
  List<int> snakeY = [0];

  @override
  void initState() {
    super.initState();
    reset();
    timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      if (!isCompleted) {
        moveSnake();
        eatFood();
      }
    });
  }

  void reset() {
    x = 0;
    y = 0;
    xVel = 1;
    yVel = 0;
    length = 1;
    snakeX = [0];
    snakeY = [0];
    getFood();
    if (isCompleted) {
      setState(() {
        isCompleted = false;
      });
    }
  }

  void moveSnake() {
    x += xVel * size;
    y += yVel * size;
    if (x >= width) {
      x = 0;
    }
    if (y >= height) {
      y = 0;
    }
    if (x < 0) {
      x = width;
    }
    if (y < 0) {
      y = height;
    }

    snakeX.insert(0, x);
    snakeY.insert(0, y);

    if (snakeX.length > length) {
      snakeX.removeLast();
      snakeY.removeLast();
    }
    checkDeath();
    setState(() {});
  }

  void getFood() {
    setState(() {
      foodX = Random().nextInt((width / size).floor()) * size;
      foodY = Random().nextInt((height / size).floor()) * size;
    });
  }

  void eatFood() {
    if (x == foodX && y == foodY) {
      length++;
      snakeX.add(snakeX.last);
      snakeY.add(snakeY.last);

      getFood();
      while (snakeX.contains(foodX) && snakeY.contains(foodY)) {
        getFood();
      }
    }
  }

  void checkDeath() {
    for (int i = 1; i < length; i++) {
      if (snakeX[0] == snakeX[i] && snakeY[0] == snakeY[i]) {
        isCompleted = true;
      }
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void _onScreenKeyEvent(String key) {
    if (key == 'up') {
      if (yVel != 1) {
        xVel = 0;
        yVel = -1;
      }
    } else if (key == 'down') {
      if (yVel != -1) {
        xVel = 0;
        yVel = 1;
      }
    } else if (key == 'left') {
      if (xVel != 1) {
        xVel = -1;
        yVel = 0;
      }
    } else if (key == 'right') {
      if (xVel != -1) {
        xVel = 1;
        yVel = 0;
      }
    }
  }

  void _handleKeyEvent(RawKeyEvent event) {
    if (isCompleted) {
      if (event.logicalKey == LogicalKeyboardKey.space) {
        reset();
      }
      return;
    }

    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      if (yVel != 1) {
        xVel = 0;
        yVel = -1;
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      if (yVel != -1) {
        xVel = 0;
        yVel = 1;
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowLeft) {
      if (xVel != 1) {
        xVel = -1;
        yVel = 0;
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowRight) {
      if (xVel != -1) {
        xVel = 1;
        yVel = 0;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snake Game"),
      ),
      body: Center(
        child: RawKeyboardListener(
          autofocus: true,
          focusNode: FocusNode(),
          onKey: _handleKeyEvent,
          child: FittedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Score: ${length - 1}',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey, width: 1)),
                  height: height.toDouble(),
                  width: width.toDouble(),
                  child: Stack(children: [
                    Positioned(
                        top: foodY.toDouble(),
                        left: foodX.toDouble(),
                        child: Container(
                          margin: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          width: size.toDouble() - 4,
                          height: size.toDouble() - 4,
                        )),
                    ...List.generate(
                        length,
                        (index) => Snake(
                              x: snakeX[index],
                              y: snakeY[index],
                            )),
                    Snake(
                      x: x,
                      y: y,
                    ),
                    Visibility(
                      visible: isCompleted,
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'GAME OVER',
                              style: TextStyle(
                                  color: Colors.red.shade600,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold),
                            ),
                            MediaQuery.of(context).size.height >
                                        MediaQuery.of(context).size.width ||
                                    defaultTargetPlatform ==
                                        TargetPlatform.iOS ||
                                    defaultTargetPlatform ==
                                        TargetPlatform.android
                                ? ElevatedButton(
                                    onPressed: () {
                                      reset();
                                    },
                                    child: const Text('Restart'),
                                  )
                                : Text(
                                    'Press SPACE to restart',
                                    style: TextStyle(
                                        color: Colors.red.shade600,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
                if (!isCompleted &&
                        (MediaQuery.of(context).size.height >
                            MediaQuery.of(context).size.width) ||
                    defaultTargetPlatform == TargetPlatform.iOS ||
                    defaultTargetPlatform == TargetPlatform.android)
                  Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      FloatingActionButton(
                        heroTag: 'up',
                        onPressed: () {
                          _onScreenKeyEvent('up');
                        },
                        child: const Icon(Icons.keyboard_arrow_up),
                      ),
                      Row(
                        children: [
                          FloatingActionButton(
                            heroTag: 'left',
                            onPressed: () {
                              _onScreenKeyEvent('left');
                            },
                            child: const Icon(Icons.keyboard_arrow_left),
                          ),
                          const SizedBox(
                            width: 50,
                          ),
                          FloatingActionButton(
                            heroTag: 'right',
                            onPressed: () {
                              _onScreenKeyEvent('right');
                            },
                            child: const Icon(Icons.keyboard_arrow_right),
                          ),
                        ],
                      ),
                      FloatingActionButton(
                        heroTag: 'down',
                        onPressed: () {
                          _onScreenKeyEvent('down');
                        },
                        child: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Snake extends StatelessWidget {
  const Snake({Key? key, required this.x, required this.y}) : super(key: key);

  final int x;
  final int y;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: y.toDouble(),
      left: x.toDouble(),
      child: Container(
        decoration:
            const BoxDecoration(color: Colors.amber, shape: BoxShape.circle),
        width: size.toDouble(),
        height: size.toDouble(),
      ),
    );
  }
}
