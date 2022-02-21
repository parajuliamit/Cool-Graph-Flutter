import 'package:flutter/material.dart';

class ThicknessButton extends StatelessWidget {
  const ThicknessButton({
    required this.onPressed,
    required this.icon,
    Key? key,
  }) : super(key: key);
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: onPressed, color: Colors.white, icon: Icon(icon));
  }
}
