import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'constants.dart';

void main() => runApp(const BMiCalculator());

class BMiCalculator extends StatelessWidget {
  const BMiCalculator({super.key});

  @override
  Widget build(BuildContext context) {

    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: kCardColorInactive,
      brightness: Brightness.dark,
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMi Calculator',
      theme: ThemeData(
        colorScheme: colorScheme,
        scaffoldBackgroundColor: colorScheme.onSecondary,
      ),
      home: const InputPage(),
    );
  }
}
