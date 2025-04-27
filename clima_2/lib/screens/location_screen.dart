import 'package:clima_2/services/weather_service.dart';
import 'package:flutter/material.dart';
import 'package:clima_2/constants/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final dynamic locationWeather;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final WeatherService weather = WeatherService();

  int temperature = 0;
  Widget weatherIcon = const SizedBox();
  String cityName = '';
  String description = '';
  String weatherMessage = 'Loading...';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    if (weatherData == null || weatherData['cod'] != 200) {
      setState(() {
        temperature = 0;
        weatherIcon = Image.asset('images/404cloud.png', height: 120, width: 150);
        weatherMessage = 'Check your writing';
        cityName = '';
        description = '';
      });
      return;
    }

    setState(() {
      temperature = weatherData['main']['temp'].toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature);
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
    });
  }

  Future<void> updateWeatherFromLocation() async {
    final data = await weather.getLocationWeather();
    updateUI(data);
  }

  Future<void> updateWeatherFromCity() async {
    final typedName = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const CityScreen()),
    );

    if (typedName != null) {
      final data = await weather.getCityWeather(typedName);
      updateUI(data);
    }
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
              kLightBlueColor ,
              kWhiteColor,
              kLightPinkColor,
              kPinkColor,
            ],
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              final isPortrait = orientation == Orientation.portrait;
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.person_pin_circle_outlined,
                            size: 50.0, color: kGrayColor),
                        onPressed: updateWeatherFromLocation,
                      ),
                      IconButton(
                        icon: const Icon(Icons.search_rounded,
                            size: 50.0, color: kGrayColor),
                        onPressed: updateWeatherFromCity,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('$temperature°', style: isPortrait ? kTempTextStyle: kLandscapeTempTextStyle),
                          const SizedBox(width: 8.0),
                          weatherIcon,
                        ],
                      ),
                      Text(
                        description,
                        textAlign: TextAlign.center,
                        style: isPortrait
                            ? kConditionTextStyle
                            : kLandscapeConditionTextStyle,
                      ),
                    ],
                  ),
                  AutoSizeText(
                    cityName.isNotEmpty
                        ? '$weatherMessage in $cityName'
                        : 'Please\nCheck your writing',
                    textAlign: TextAlign.center,
                    style: isPortrait
                        ? kMessageTextStyle
                        : kLandscapeMessageTextStyle,
                    maxLines: 4,
                    minFontSize: 20.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (isPortrait) const SizedBox(height: 40.0),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
