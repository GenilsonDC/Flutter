import 'package:flutter/material.dart';

class CustomCircleAvatar extends StatelessWidget {
  final double radius;
  final String imagePath;
  final Offset offset;

  const CustomCircleAvatar({
    required this.radius,
    required this.imagePath,
    required this.offset,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: radius * 2,
        height: radius * 2,
        child: Stack(
          children: [
            Positioned(
              left: offset.dx,
              top: offset.dy,
              child: Image.asset(
                imagePath,
                width: radius * 2,
                height: radius * 2,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
