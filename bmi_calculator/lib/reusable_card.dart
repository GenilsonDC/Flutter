import 'package:flutter/material.dart';
class ReusableCard extends StatelessWidget {
  const ReusableCard(
      {super.key, required this.customColor, required this.cardChild});

  final Color customColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: customColor, borderRadius: BorderRadius.circular(10.0)),
      child: cardChild,
    );
  }
}
