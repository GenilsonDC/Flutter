import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.bmiResult,
      required this.resultText,
      required this.messageResult});

  final String bmiResult;
  final String resultText;
  final String messageResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          margin: const EdgeInsets.only(bottom: 0.0),
          child: AppBar(
            backgroundColor: kHeaderColor,
            title: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Center(
                  child: Text(
                'Results',
                style: kResultsHeaderTextLabel,
              )),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 15.0),
              child: Text(
                'Your Result',
                style: kResultsBodyTextLabel,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              cardColor: kHeaderColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: resultText == 'Normal'
                        ? kResultsNormalWeightTextLabel
                        : resultText == 'Overweight'
                            ? kResultsObesityWeightTextLabel
                            : kResultsUnderWeightTextLabel,
                  ),
                  Text(
                    bmiResult,
                    style: kResultsNumbersLabel,
                  ),
                  Text(
                    messageResult,
                    style: resultText == 'Normal'
                        ? kResultsNormalMessageLabel
                        : resultText == 'Overweight'
                        ? kResultsOverWeightMessageLabel
                        : kResultsUnderWeightMessageLabel,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              ontTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'Back')
        ],
      ),
    );
  }
}
