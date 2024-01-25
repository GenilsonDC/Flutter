import 'package:flutter/material.dart';

void main() {
  runApp(const MyAppCard());
}

class MyAppCard extends StatelessWidget {
  const MyAppCard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 3, 62, 62),
        body: SafeArea(
          child: Container(
            height: 60.0,
            width: 415.0,
            margin: const EdgeInsets.only(left: 20.0, right: 20.0),
            padding: const EdgeInsets.only(top: 20.0),
            color: const Color.fromARGB(255, 3, 62, 62),
            child: const Text(
              'Genilson do Carmo',
              style: TextStyle(
                color: Color.fromARGB(255, 102, 205, 170),
                fontSize: 29.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
