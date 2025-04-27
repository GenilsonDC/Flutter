import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:clima/constants/constants.dart';
import 'package:clima/services/weather.dart';
import 'city_screen.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, this.locationWeather});

  final locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int? temperature;
  Widget? weatherIcon;
  String? cityName;
  String? description;
  String? weatherMessage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null || weatherData['cod'] != 200) {
        temperature = 0;
        weatherIcon = Image.asset(
          'images/404.png',
          height: 120,
          width: 150,
        );
        weatherMessage = 'Check your writing';
        cityName = '';
        description = '';
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherMessage = weather.getMessage(temperature!);
      cityName = weatherData['name'];
      description = weatherData['weather'][0]['description'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/clouds.gif'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: OrientationBuilder(
            builder: (context, orientation) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      TextButton(
                        onPressed: () async {
                          var weatherData = await weather.getLocationWeather();
                          updateUI(weatherData);
                        },
                        child: const Icon(
                          Icons.near_me,
                          size: 50.0,
                          color: kBraunColor,
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          var typedName = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const CityScreen();
                              },
                            ),
                          );
                          if (typedName != null) {
                            var weatherData =
                            await weather.getCityWeather(typedName);
                            updateUI(weatherData);
                          }
                        },
                        child: const Icon(
                          Icons.location_city_rounded,
                          size: 50.0,
                          color: kBraunColor,
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '$temperature°',
                              style: kTempTextStyle,
                            ),
                            weatherIcon ?? const SizedBox(),
                          ],
                        ),
                        Text(
                          '$description',
                          textAlign: TextAlign.left,
                          style: orientation == Orientation.portrait
                              ? kConditionTextStyle
                              : kLandscapeConditionTextStyle,
                        ),
                      ],
                    ),
                  ),
                  AutoSizeText(
                    cityName!.isNotEmpty ? '$weatherMessage in $cityName' : 'Please\nCheck your writing',
                    textAlign: TextAlign.center,
                    style: orientation == Orientation.portrait
                        ? kMessageTextStyle
                        : kLandscapeMessageTextStyle,
                    maxLines: 4,
                    minFontSize: 20.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: orientation == Orientation.portrait ? 40.0 : 1.0,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
