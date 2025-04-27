import 'package:clima_2/constants/constants.dart';
import 'package:flutter/material.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  final TextEditingController cityController = TextEditingController();

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  void submitCityName() {
    final typedCity = cityController.text.trim();
    Navigator.pop(context, typedCity.isNotEmpty ? typedCity : null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              kBlackColor,
              kLightBlueColor ,
              kLightYellowColor ,
              kLightPinkColor,
              kPinkColor,
            ],
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_circle_left,
                    size: 60,
                    color: kWhiteColor,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: cityController,
                  style: const TextStyle(
                    color: kBlackColor,
                    fontSize: 23.0,
                    fontWeight: FontWeight.w600,
                  ),
                  decoration: kTextFieldInputDecoration,
                  onSubmitted: (_) => submitCityName(),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:  kPinkColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    foregroundColor: kBlackColor,
                    overlayColor: kLightBlueColor.withOpacity(0.7),
                    textStyle: kButtonTextStyle,

                  ),
                  onPressed: submitCityName,
                  child: const Text('Get Weather'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
