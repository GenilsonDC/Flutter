import 'questions_brain.dart';
import 'package:flutter/material.dart';

class CheckAnswer {
  int questionNumber = 0;
  List<Icon> scoreIcons = [];
  QuestionsBrain questionBrain = QuestionsBrain();

  void checkAnswer(bool userAnswer, Function updateState) {
    bool correctAnswer =
        questionBrain.questionsBuffer[questionNumber].questionAnswer;
    if (userAnswer == correctAnswer) {
      scoreIcons.add(
        const Icon(
          Icons.check,
          color: Colors.green,
        ),
      );
    } else {
      scoreIcons.add(
        const Icon(
          Icons.close,
          color: Colors.redAccent,
        ),
      );
    }

    if (questionNumber < questionBrain.questionsBuffer.length - 1) {
      questionNumber++;
    } else {
      questionNumber = 0;
      scoreIcons = [];
    }

    updateState();
  }
}
