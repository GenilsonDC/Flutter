import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          margin: const EdgeInsets.only(bottom: 0.0),
          child: AppBar(
            backgroundColor: const Color(0xff040024),
            title: const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Center(
                child: Text(
                  'BMi Calculator',
                  style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 35.0,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: const Color(0xff4E4958),
                      borderRadius: BorderRadius.circular(10.0)),
                )),
              ),
              Expanded(
                child: Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                      color: const Color(0xff4E4958),
                      borderRadius: BorderRadius.circular(10.0)),
                )),
              ),
            ],
          )),
          const Expanded(
            child: ReusableCard(),
          ),
          const Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(),
              ),
              Expanded(
                child: ReusableCard(),
              ),
            ],
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: const Color(0xff4E4958),
          borderRadius: BorderRadius.circular(10.0)),
    ));
  }
}
