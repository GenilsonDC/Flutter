import 'package:flutter/material.dart';
import 'constants/constants.dart';
import 'screens/loading_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clima',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kBlueColor) ,
        useMaterial3: true,
      ),
      // ignore: prefer_const_constructors
      home: LoadingScreen(),
    );
  }
}


