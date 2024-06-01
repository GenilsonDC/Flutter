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
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.pink,
                  shape: const LinearBorder()),
                  child: const Text(''),
                  onPressed: () {
                    playSound(1);
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.indigo,
                  shape: const LinearBorder()),
                  child: const Text(
                    '',
                  ),
                  onPressed: () {
                    playSound(2);
                  },
                ),
              ),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.cyan,
                      shape: const LinearBorder()),
                  child: const Text(
                    '',
                  ),
                  onPressed: () {
                    playSound(3);
                  },
                ),
              ),Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.green,
                      shape: const LinearBorder()),
                  child: const Text(
                    '',
                  ),
                  onPressed: () {
                    playSound(4);
                  },
                ),
              ),Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.yellow,
                      shape: const LinearBorder()),
                  child: const Text(
                    '',
                  ),
                  onPressed: () {
                    playSound(5);
                  },
                ),
              ),Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.orange,
                      shape: const LinearBorder()),
                  child: const Text(
                    '',
                  ),
                  onPressed: () {
                    playSound(6);
                  },
                ),
              ),Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red,
                      shape: const LinearBorder()),
                  child: const Text(
                    '',
                  ),
                  onPressed: () {
                    playSound(7);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
