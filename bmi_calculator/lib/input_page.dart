import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'app_colors.dart';

const bottomContainerHeight = 90.0;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
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
            backgroundColor: headerColor,
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
                  child: GestureDetector(
                    onTap: () => _toggleGender(true),
                    child: ReusableCard(
                      customColor:
                          _maleSelected ? cardColor : inactiveButtonColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.mars,
                        iconColor: _maleSelected ? iconCardMale : iconCardColor,
                        label: 'Male',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => _toggleGender(false),
                    child: ReusableCard(
                      customColor:
                          _femaleSelected ? cardColor : inactiveButtonColor,
                      cardChild: IconContent(
                        icon: FontAwesomeIcons.venus,
                        iconColor:
                            _femaleSelected ? iconCardFemale : iconCardColor,
                        label: 'Female',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
            child: ReusableCard(
              cardChild: Column(
                children: <Widget>[],
              ),
              customColor: cardColor,
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
                    customColor: cardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[],
                    ),
                    customColor: cardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
