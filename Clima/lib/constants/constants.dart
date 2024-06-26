import 'package:flutter/material.dart';

const kBraunColor = Color(0xff512f01);
const kLightHorizon = Color(0xa1fdedce);
const kLightYellowColor = Color(0xffFFF455);
const kYellowColor = Color(0xffFFC700);
const kLightRedColor = Color(0xffEE4E4E);
const kBlackColorBg = Color(0xff000622);

const kTempTextStyle = TextStyle(
  fontFamily: 'Dosis',
  fontSize: 120.0,
  fontWeight: FontWeight.w500,
  color: Colors.white,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Dosis',
  fontWeight: FontWeight.w600,
  fontSize: 50.0,
  color: kBraunColor,
);

const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontFamily: 'Dosis',
  color: kLightRedColor,
);

const kConditionTextStyle = TextStyle(
  fontSize: 40.0,
  fontFamily: 'Dosis',
  fontWeight: FontWeight.w300,
  color: kBraunColor,
);
const kLandscapeConditionTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Dosis',
  fontWeight: FontWeight.w400,
  color: kBraunColor,
);
const kLandscapeMessageTextStyle = TextStyle(
  fontFamily: 'Dosis',
  fontWeight: FontWeight.w600,
  color: kBraunColor,
);

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
