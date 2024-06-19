import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(const BMiCalculator());

class BMiCalculator extends StatelessWidget {
  const BMiCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = ColorScheme.fromSeed(
      seedColor: const Color(0xff040024),
    );
    return MaterialApp(
      title: 'BMi Calculator',
      theme: ThemeData(
          colorScheme: colorScheme,
          scaffoldBackgroundColor: colorScheme.secondary,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: colorScheme.onTertiary,
            foregroundColor: colorScheme.primary,
          )),
      home: const InputPage(),
    );
  }
}

