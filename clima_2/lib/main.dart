import 'package:clima_2/constants/constants.dart';
import 'package:clima_2/screens/loading_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Clima2());
}

class Clima2 extends StatelessWidget {
  const Clima2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Clima 2.0",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kLightBlueColor),
        useMaterial3: true,
      ),
      home: const LoadingScreen(),
    );
  }
}
