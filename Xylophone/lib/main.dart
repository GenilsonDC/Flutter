import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {
  const XylophoneApp({super.key});

  void playSound(int soundNumber) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey({required Color colorKey, required int soundNumber }){
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: colorKey,
            shape: const LinearBorder()),
        child: const Text(''),
        onPressed: () {
          playSound(soundNumber);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xylophone',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(colorKey: Colors.red, soundNumber: 1),
              buildKey(colorKey: Colors.orangeAccent, soundNumber: 2),
              buildKey(colorKey: Colors.yellow, soundNumber: 3),
              buildKey(colorKey: Colors.green, soundNumber: 4),
              buildKey(colorKey: Colors.blueAccent, soundNumber: 5),
              buildKey(colorKey: Colors.purple, soundNumber: 6),
              buildKey(colorKey: Colors.pink, soundNumber: 7),

            ],
          ),
        ),
      ),
    );
  }
}
