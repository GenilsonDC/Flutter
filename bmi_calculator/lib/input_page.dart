import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';

const bottomContainerHeight = 90.0;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _height = 180;
  bool _maleSelected = false;
  bool _femaleSelected = true;

  void _toggleGender(bool isMale) {
    setState(() {
      if (isMale) {
        _maleSelected = true;
        _femaleSelected = false;
      } else {
        _maleSelected = false;
        _femaleSelected = true;
      }
    });
  }

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
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  'BMi Calculator',
                  style: kHeaderTextLabel,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () => _toggleGender(true),
                    child: ReusableCard(
                      cardColor: _maleSelected
                          ? kCardColorSelected
                          : kCardColorInactive,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconColor:
                            _maleSelected ? kIconCardMale : kIconCardColor,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _toggleGender(false),
                    child: ReusableCard(
                      cardColor: _femaleSelected
                          ? kCardColorSelected
                          : kCardColorInactive,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconColor:
                            _femaleSelected ? kIconCardFemale : kIconCardColor,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
           Expanded(
            child: ReusableCard(
              cardChild: Column(
                children: <Widget>[
                  Text(
                    'Height',
                    style: kTextLabel,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _height.toString(),
                        style: kNumbersLabel,
                      ),
                      Text(
                        'cm',
                        style: kTextLabel,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: kCardTextColor,
                      inactiveTrackColor: kIconCardColor,
                      thumbColor: _maleSelected ? kIconCardMale: kIconCardFemale,
                      overlayColor: _maleSelected ? kIconCardMale.withAlpha(123) : kIconCardFemale.withAlpha(123),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0)
                    ),
                    child: Slider(value: _height.toDouble(),
                        min: 120,
                        max: 310,
                        onChanged: (double newValue) {
                      setState(() {
                        _height = newValue.round();

                      });

                        },),
                  )
                ],
              ),
              cardColor: kCardColorSelected,
            ),
          ),
          const Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[],
                    ),
                    cardColor: kCardColorSelected,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[],
                    ),
                    cardColor: kCardColorSelected,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
            child: const Center(
              child: Text(
                'Calculate',
                style: kBottomTextLabel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
