import 'package:flutter/material.dart';

void main() => runApp(const BMiCalculator());

class BMiCalculator extends StatelessWidget {
  const BMiCalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const InputPage(),
      theme: ThemeData.dark(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text('BMi Calculator',
          style: TextStyle(fontSize: 35.0,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),),
        ),
      ),
      body: const Center(
        child: Text("############"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
