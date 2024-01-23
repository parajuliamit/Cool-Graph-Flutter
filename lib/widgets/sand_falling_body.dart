import 'dart:math';

import 'package:flutter/material.dart';

class SandFallingBody extends StatefulWidget {
  const SandFallingBody({Key? key, required this.size}) : super(key: key);
  final Size size;
  @override
  State<SandFallingBody> createState() => _SandFallingBodyState();
}

const int _gridCellSize = 10;

class _SandFallingBodyState extends State<SandFallingBody>
    with TickerProviderStateMixin {
  late final AnimationController _controller;
  late final Random random;
  late final int _gridSizeH;
  late final int _gridSizeW;
  final Set<(int, int)> _grid = {};
  final Set<(int, int)> _nextGrid = {};

  void _updateGrid() {
    _nextGrid.clear();
    for (var data in _grid) {
      int x = data.$1;
      int y = data.$2;
      if (y < _gridSizeH - 1) {
        if (!_grid.contains((x, y + 1))) {
          _nextGrid.add((x, y + 1));
        } else {
          bool left = random.nextBool();
          bool leftAvailable = x - 1 >= 0 && !_grid.contains((x - 1, y + 1));
          bool rightAvailable =
              x + 1 < _gridSizeW && !_grid.contains((x + 1, y + 1));
          if (leftAvailable && (left || !rightAvailable)) {
            _nextGrid.add((x - 1, y + 1));
          } else if (rightAvailable) {
            _nextGrid.add((x + 1, y + 1));
          } else {
            _nextGrid.add((x, y));
          }
        }
      } else {
        _nextGrid.add((x, y));
      }
    }
    if (_nextGrid.toString() == _grid.toString()) {
      _controller.stop();
    }
    setState(() {
      _grid.clear();
      _grid.addAll(_nextGrid);
    });
  }

  @override
  void initState() {
    super.initState();
    _gridSizeH = (widget.size.height / _gridCellSize).floor();
    _gridSizeW = (widget.size.height / _gridCellSize).floor();
    random = Random();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(_updateGrid);
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _addToGrid(details, double height, double width) {
    int x = (details.localPosition.dx / (width / _gridSizeW)).floor();
    int y = (details.localPosition.dy / (height / _gridSizeH)).floor();
    for (int i = -2; i < 2; i++) {
      for (int j = -2; j < 2; j++) {
        if (x + i < _gridSizeW && y + j < _gridSizeH) {
          _grid.add((x + i, y + j));
        }
      }
    }
    if (!_controller.isAnimating) {
      _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = widget.size.height;
    double width = widget.size.width;
    return GestureDetector(
      onPanUpdate: (details) {
        _addToGrid(details, height, width);
      },
      onPanDown: (details) {
        _addToGrid(details, height, width);
      },
      child: Stack(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.black,
          ),
          ...List.generate(_grid.length, (index) {
            var data = _grid.elementAt(index);
            int x = data.$1;
            int y = data.$2;
            return Positioned(
              left: x * (width / _gridSizeW),
              top: y * (height / _gridSizeH),
              child: Container(
                height: height / _gridSizeH,
                width: width / _gridSizeW,
                color:
                    HSLColor.fromAHSL(1, (index / 4) % 360, 1, 0.5).toColor(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
