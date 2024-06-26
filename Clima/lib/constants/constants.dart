import 'package:flutter/material.dart';

const kBlueColor = Color(0xff425455);
const kLightHorizon = Color(0xa1fdedce);
const kLightYellowColor = Color(0xffFFF455);
const kYellowColor = Color(0xffFFC700);
const kLightRedColor = Color(0xffEE4E4E);
const kBlackColorBg = Color(0xff000622);

const kTempTextStyle = TextStyle(
  fontFamily: 'Dosis',
  fontSize: 100.0,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Dosis',
  fontSize: 60.0,
  color: Colors.white,
);

const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Dosis',
  color: kLightRedColor,
);

const kConditionTextStyle = TextStyle(fontSize: 90.0, color: kYellowColor);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: kLightHorizon,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: Colors.blueGrey,

  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    borderSide: BorderSide.none,
  ),
);
