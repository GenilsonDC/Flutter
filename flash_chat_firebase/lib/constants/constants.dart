import 'package:flutter/material.dart';

const bgcolor = Color(0xFF3C3C3C);
const appBarColor = Color(0xFF3C3C3C);
const bottonBarColor = Color(0xFF00C6DC);


const kSendButtonTextStyle = TextStyle(
  color: Colors.red,
  fontWeight: FontWeight.bold,
  fontSize: 18.0,
);


const kTextFieldDecoration = InputDecoration(
  hintText: 'Insira um texto',
  hintStyle: TextStyle(color: Color(0x5f424242)),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff00adff), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff00adff), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kMessageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const colorizeColors = [
  Color(0xff474747),
  Color(0xff083efa),
  Color(0xff06f2fa),
  Color(0xffffffff),
  Color(0xff9f00ef),
];

const colorizeTextStyle = TextStyle(
  fontSize: 47.0,
  fontWeight: FontWeight.bold,
);
