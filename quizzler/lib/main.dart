import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'questions_brain.dart';

QuestionsBrain questionBrain = QuestionsBrain();

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreIcons = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = questionBrain.getQuestionAnswer();
    setState(() {
      if (questionBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.success,
          title: "Fim ",
          desc: "Você finalizou o Quizzler!\n Parabéns.",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              gradient: const LinearGradient(colors: [
                Color.fromRGBO(116, 116, 191, 1.0),
                Color.fromRGBO(52, 138, 199, 1.0)
              ]),
              child: const Text(
                "Fechar",
                style: TextStyle(
                    fontFamily: 'Staatliches',
                    color: Colors.white, fontSize: 30),
              ),
            )
          ],
        ).show();
        questionBrain.reset();
        scoreIcons = [];
      } else {
        if (userAnswer == correctAnswer) {
          scoreIcons.add(const Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreIcons.add(const Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        questionBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Staatliches',
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.greenAccent,
                  foregroundColor: Colors.white),
              child: const Text(
                'Verdadeiro',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  foregroundColor: Colors.white),
              child: const Text(
                'Falso',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreIcons,
        ),
      ],
    );
  }
}
