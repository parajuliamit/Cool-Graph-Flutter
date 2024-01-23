import 'dart:math';

class Drop {
  late double x;
  late double y;
  late final double z;
  late double ySpeed;
  final double width;
  final double height;
  late final double thickness;
  late final double length;
  late final double randomZ;
  bool isSplatter = false;

  Drop(this.width, this.height) {
    x = Random().nextDouble() * width;
    y = -Random().nextInt(500).toDouble();
    randomZ = Random().nextDouble();
    z = randomZ * 20;
    ySpeed = (randomZ * 5) + 4;
    length = (randomZ * 30) + 20;
    thickness = (randomZ * 2) + 0.5;
  }

  void fall() {
    isSplatter = false;
    y += ySpeed;
    ySpeed += randomZ * 0.05;
    if (y > height) {
      y = -Random().nextInt(500).toDouble();
      ySpeed = (randomZ * 5) + 4;
    }
    if (y >= height - length) {
      isSplatter = true;
    }
  }
}
