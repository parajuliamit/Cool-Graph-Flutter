import 'dart:async';

import 'package:flutter/material.dart';

class SandFalling extends StatefulWidget {
  const SandFalling({super.key});

  @override
  State<SandFalling> createState() => _SandFallingState();
}

const int _gridSize = 50;

class _SandFallingState extends State<SandFalling> {
  late final Timer _timer;

  final List<List<bool>> _grid =
      List.generate(_gridSize, (_) => List.filled(_gridSize, false));
  final List<List<bool>> _nextGrid =
      List.generate(_gridSize, (_) => List.filled(_gridSize, false));

  void resetGrid(List<List<bool>> _resetGrid) {
    for (int x = 0; x < _resetGrid.length; x++) {
      for (int y = 0; y < _resetGrid[x].length; y++) {
        _resetGrid[x][y] = false;
      }
    }
  }

  void _updateGrid() {
    resetGrid(_nextGrid);
    for (int x = 0; x < _gridSize; x++) {
      for (int y = 0; y < _gridSize; y++) {
        if (_grid[x][y]) {
          if (x < _gridSize - 1 && !_grid[x + 1][y]) {
            _nextGrid[x + 1][y] = true;
          } else {
            _nextGrid[x][y] = true;
          }
        }
      }
    }
    setState(() {
      for (int x = 0; x < _gridSize; x++) {
        for (int y = 0; y < _gridSize; y++) {
          _grid[x][y] = _nextGrid[x][y];
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _updateGrid();
    _timer = Timer.periodic(
        const Duration(milliseconds: 1000), (_) => _updateGrid());
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sand Falling"),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double height = constraints.maxHeight;
          double width = constraints.maxWidth;
          return GestureDetector(
            onPanUpdate: (details) {
              int x = (details.localPosition.dx / (width / _gridSize)).floor();
              int y = (details.localPosition.dy / (height / _gridSize)).floor();
              if (x < _gridSize && y < _gridSize) {
                setState(() {
                  _grid[y][x] = true;
                });
              }
            },
            onPanDown: (details) {
              int x = (details.localPosition.dx / (width / _gridSize)).floor();
              int y = (details.localPosition.dy / (height / _gridSize)).floor();
              if (x < _gridSize && y < _gridSize) {
                setState(() {
                  _grid[y][x] = true;
                });
              }
            },
            child: Column(
              children: List.generate(_gridSize, (x) {
                return Row(
                  children: List.generate(_gridSize, (y) {
                    return Container(
                      height: height / _gridSize,
                      width: width / _gridSize,
                      color: _grid[x][y] ? Colors.white : Colors.black,
                    );
                  }),
                );
              }),
            ),
          );
        },
      ),
    );
  }
}
