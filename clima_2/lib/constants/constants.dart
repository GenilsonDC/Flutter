import 'package:flutter/material.dart';

const kLightBlueColor = Color(0xffB7E0FF);
const kLightYellowColor = Color(0xffFFF5CD);
const kLightPinkColor = Color(0xffFFCFB3);
const kPinkColor = Color(0xffE78F81);
const kWhiteColor = Color(0xffffffff);
const kGrayColor = Color(0xff494949);
const kBlackColor = Color(0xff0d0d12);

const kTempTextStyle = TextStyle(
  fontFamily: 'Dosis',
  fontSize: 120.0,
  fontWeight: FontWeight.w500,
  color: kGrayColor,
);

const kMessageTextStyle = TextStyle(
  fontWeight: FontWeight.w300,
  fontSize: 30.0,
  color: kGrayColor,
);

const kButtonTextStyle = TextStyle(
  fontSize: 25.0,
);

const kConditionTextStyle = TextStyle(
  fontSize: 40.0,
  fontWeight: FontWeight.w300,
  color: kBlackColor,
);
const kLandscapeTempTextStyle = TextStyle(
  fontFamily: 'Dosis',
  fontSize: 80.0,
  fontWeight: FontWeight.w500,
  color: kGrayColor,
);

const kLandscapeConditionTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w400,
  color: kBlackColor,
);
const kLandscapeMessageTextStyle = TextStyle(
  fontWeight: FontWeight.w300,
  color: kBlackColor,
);

const kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: kWhiteColor,
  hintText: 'Enter City Name',
  hintStyle: TextStyle(
    color: kGrayColor,
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(50.0),
    ),
    borderSide: BorderSide.none,
  ),
);
