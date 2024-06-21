import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class SquareButtons extends StatelessWidget {
  const SquareButtons({super.key, required this.icon, required this.iconColor, required this.onPressButton});

  final IconData icon;
  final Color iconColor;
  final VoidCallback onPressButton;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 60.0,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 6.0,
      fillColor: kCardColorSelected.withAlpha(230),
      onPressed: onPressButton,
      child: Icon(icon, color: iconColor),

    );
  }
}
