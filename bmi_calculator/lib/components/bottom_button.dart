import 'package:flutter/material.dart';
import '../constants.dart';
import '../screens/input_page.dart';

class BottomButton extends StatelessWidget {
  const BottomButton(
      {super.key, required this.ontTap, required this.buttonTitle});

  final VoidCallback ontTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontTap,
      child: Container(
        color: kBottomContainerColor,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 15),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Center(
          child: Text(
            buttonTitle,
            style: kBottomTextLabel,
          ),
        ),
      ),
    );
  }
}
