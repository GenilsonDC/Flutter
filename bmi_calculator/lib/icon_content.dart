import 'package:flutter/material.dart';
import 'app_colors.dart';

const customLabel = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: cardTextColor);

class IconContent extends StatelessWidget {
  const IconContent(
      {super.key,
      required this.icon,
      required this.label,
      required this.iconColor});

  final IconData icon;
  final String label;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          color: iconColor,
          size: 80.0,
        ),
        const SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: customLabel,
        ),
      ],
    );
  }
}
